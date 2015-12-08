# Maintainer: Guillaume ALAUX <guillaume at alaux dot net>
pkgname=typesafe-activator
pkgver=1.3.7
pkgrel=1
pkgdesc='Helper tools to get you started with Play and the Typesafe Reactive Platform - aka playframework'
arch=('any')
url='http://www.playframework.org/'
license=('custom')
depends=('java-environment' 'python')
conflicts=('playframework' 'playframework2')
replaces=('playframework' 'playframework2')
source=(http://downloads.typesafe.com/${pkgname}/${pkgver}/${pkgname}-${pkgver}-minimal.zip)
sha256sums=('030cf23d3b68e588b44840a66aab82d2f927fe140eba46cce566cec5fc98c27c')

package() {
  cd "${srcdir}/activator-${pkgver}-minimal"

  install -d -m 755 "${pkgdir}/usr/share/${pkgname}"
  cp -r activator-launch-${pkgver}.jar activator "${pkgdir}/usr/share/${pkgname}"
  chmod +x "${pkgdir}/usr/share/${pkgname}/activator"

  install -d -m 755 "${pkgdir}/usr/bin/"
  ln -s /usr/share/typesafe-activator/activator "${pkgdir}/usr/bin/activator"
}
