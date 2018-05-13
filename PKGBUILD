# Maintainer: archblue <jhswx84@aliyun.com>
pkgname=proxyee-down
pkgver=2.53
pkgrel=1
pkgdesc="基于HTTP代理的百度网盘不限速下载，SwitchyOmega设置请参见项目主页说明"
arch=("any")
url="https://github.com/monkeyWie/proxyee-down"
license=('Apache License 2.0')
depends=('jre8-openjdk')
source=("https://github.com/monkeyWie/proxyee-down/releases/download/${pkgver}/proxyee-down-${pkgver}-jar.zip")
md5sums=('SKIP')

package() {
  cd "${srcdir}"
  unzip -o proxyee-down-${pkgver}-jar.zip -d ${pkgdir}/opt
  cd "${pkgdir}/opt/${pkgname}-${pkgver}"
  echo -e "#!/bin/bash \n /usr/bin/java -jar /opt/${pkgname}-${pkgver}/proxyee-down.jar" >  ${pkgname}
  chmod o+rw -R  .
  chmod 755 ${pkgname}
  install -Dm 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
