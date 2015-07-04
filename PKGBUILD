# Maintainer: Guillaume ALAUX <guillaume at alaux dot net>
pkgname=typesafe-activator
pkgver=1.3.5
pkgrel=1
pkgdesc='Helper tools to get you started with Play and the Typesafe Reactive Platform - aka playframework'
arch=('any')
url='http://www.playframework.org/'
license=('custom')
depends=('java-environment' 'python')
conflicts=('playframework' 'playframework2')
replaces=('playframework' 'playframework2')
source=(http://downloads.typesafe.com/${pkgname}/${pkgver}/${pkgname}-${pkgver}-minimal.zip)
sha256sums=('bafa6f3ab8078c446b9c019297fb8123c2987d934924160a3dbba95b8136f8ca')

package() {
  cd "${srcdir}/activator-${pkgver}-minimal"

  install -d -m 755 "${pkgdir}/usr/share/${pkgname}"
  cp -r activator-launch-${pkgver}.jar activator "${pkgdir}/usr/share/${pkgname}"
  chmod +x "${pkgdir}/usr/share/${pkgname}/activator"

  install -d -m 755 "${pkgdir}/usr/bin/"
  ln -s /usr/share/typesafe-activator/activator "${pkgdir}/usr/bin/activator"
}
