# Maintainer: Hai Zhang <dreaming.in.code.zh@gmail.com>

pkgname=tp-battery-mode
pkgver=1.2.0
pkgrel=2
pkgdesc="Module to manage the battery mode (lifetime/runtime) of your Thinkpad"
url="https://github.com/zhanghai/tp-battery-mode"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('tpacpi-bat')
backup=("etc/${pkgname}.conf")
source=("https://github.com/zhanghai/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8186699a537c7675400526c670e09b0693637a44bf31beb23fd8be33e2eb5a0a')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.conf" "${pkgdir}/etc/${pkgname}.conf"
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
