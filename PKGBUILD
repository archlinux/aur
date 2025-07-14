# Maintainer: longyinstudio<1606776851@qq.com>
# Contributor: longyinstudio<1606776851@qq.com>
pkgname=cn-dascom-pin-driver
pkgver=2.0.6
pkgrel=1
pkgdesc="Dascom Pin Dirver (Supported models include 24-pin、AR-510N(include AR-570 ...) and some DS Series.)"
arch=('x86_64')
url="https://www.dascom.cn/"
license=('mit')
depends=('cups' 'cups-pdf' 'cups-filters' 'ghostscript' 'system-config-printer')
# options=('!strip' '!emptydirs')
# source_x86_64=("https://raw.githubusercontent.com/LongYinStudio/printers-drivers/refs/heads/main/cn.dascom.pin-driver_2.0.6_amd64.deb")
source=("https://raw.githubusercontent.com/LongYinStudio/printers-drivers/refs/heads/main/cn.dascom.pin-driver_2.0.6_amd64.deb")
# sha256sums=('79d276d5cdf93e2c39ff842821bbde50fae68cf47249844ef28425e0e6a9b6e0')
sha256sums=('SKIP')
# install=cn-dascom-pin-driver.install
# makedepends=('')

package() {
  # 解压 .deb 文件
  cd "$srcdir" || exit
  ar x cn.dascom.pin-driver_2.0.6_amd64.deb

  # 提取 data.tar.xz
  tar -xpf data.tar.xz -C "$pkgdir"

  # 需要改到root，不上无法打印
  chown root:root "$pkgdir/opt/dascom/pin_driver/bin/pdftodspdfpin"
  chown root:root "$pkgdir/opt/dascom/pin_driver/bin/rastertodascom"
  # chown root:root "$pkgdir/usr/lib/cups/filter/pdftodspdfpin"
  # chown root:root "$pkgdir/usr/lib/cups/filter/rastertodascom"

  # 清理临时文件
  rm -f control.tar.xz data.tar.xz debian-binary
}
