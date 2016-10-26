# Maintainer: Guillaume ALAUX <guillaume at alaux dot net>
pkgname=lightbend-activator
pkgver=1.3.10
pkgrel=1
pkgdesc="Lightbend Reactive Platform's build and tutorial tool"
arch=('any')
url='http://www.lightbend.com/community/core-tools/activator-and-sbt'
license=('custom')
depends=('java-environment')
replaces=('typesafe-activator')
conflicts=('typesafe-activator')
source=(https://downloads.typesafe.com/typesafe-activator/${pkgver}/typesafe-activator-${pkgver}-minimal.zip)
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
    /usr/share/${pkgname}/bin/activator \
    "${pkgdir}/usr/bin/activator"
}
