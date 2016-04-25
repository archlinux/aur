# Maintainer: Guillaume ALAUX <guillaume at alaux dot net>
pkgname=typesafe-activator
pkgver=1.3.10
pkgrel=1
pkgdesc='Helper tools to get you started with Play and the Typesafe Reactive Platform - aka playframework'
arch=('any')
url='http://www.playframework.org/'
license=('custom')
depends=('java-environment')
source=(http://downloads.typesafe.com/${pkgname}/${pkgver}/${pkgname}-${pkgver}-minimal.zip)
sha256sums=('15352ce253aa804f707ef8be86390ee1ee91da4b78dbb2729ab1e9cae01d8937')

package() {
  cd "activator-${pkgver}-minimal"

  install -D -m 644 \
    "libexec/activator-launch-${pkgver}.jar" \
    "${pkgdir}/usr/share/${pkgname}/libexec/activator-launch-${pkgver}.jar"
  install -D -m 755 \
    "bin/activator" \
    "${pkgdir}/usr/share/${pkgname}/bin/activator"

  install -d -m 755 "${pkgdir}/usr/bin/"
  ln -s \
    /usr/share/typesafe-activator/bin/activator \
    "${pkgdir}/usr/bin/activator"
}
