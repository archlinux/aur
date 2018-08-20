# Maintainer: archblue <jhswx84@aliyun.com>
pkgname=proxyee-down
pkgver=2.54
pkgrel=2
pkgdesc="基于HTTP代理的百度网盘(Baidu)不限速下载，SwitchyOmega设置请参见项目主页说明"
arch=("any")
url="https://github.com/monkeyWie/proxyee-down"
license=('Apache License 2.0')
depends=('java-openjfx')
makedepends=('unzip'
             'binutils')
source=("https://github.com/monkeyWie/proxyee-down/releases/download/${pkgver}/proxyee-down-${pkgver}-jar.zip")
md5sums=('SKIP')

package() {
  cd "${srcdir}"
  unzip -o proxyee-down-${pkgver}-jar.zip -d ${pkgdir}/opt
  mv "${pkgdir}/opt/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
  cd "${pkgdir}/opt/${pkgname}"
  chmod o+rw -R  .
  echo '/usr/bin/java -jar /opt/proxyee-down/proxyee-down.jar' > ${pkgname}
  chmod 755 ${pkgname}
  install -Dm 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
