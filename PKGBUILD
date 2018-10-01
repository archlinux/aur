# Maintainer: archblue <jhswx84@aliyun.com>
pkgname=proxyee-down
pkgver=3.12
pkgrel=1
pkgdesc="基于HTTP代理的百度网盘(Baidu)不限速下载，SwitchyOmega设置请参见项目主页说明"
arch=("any")
url="https://github.com/monkeyWie/proxyee-down"
license=('Apache License 2.0')
depends=('java-openjfx')
makedepends=('binutils')
source=("https://github.com/monkeyWie/proxyee-down/releases/download/${pkgver}/proxyee-down-main.jar")
md5sums=('SKIP')

package() {
  cd "${srcdir}"
  mkdir -p ${pkgdir}/opt/${pkgname}
  mv proxyee-down-main.jar "${pkgdir}/opt/${pkgname}"
  cd "${pkgdir}/opt/${pkgname}"
  chmod o+rw -R  .
  echo '/usr/bin/java -jar /opt/proxyee-down/proxyee-down-main.jar' > ${pkgname}
  chmod 755 ${pkgname}
  install -Dm 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
