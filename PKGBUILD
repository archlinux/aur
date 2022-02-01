# Maintainer: Maciej Łotysz <lotysz at gmail dot com>

_appname=poly
pkgname=polylith-bin
pkgver=0.2.13
pkgrel=1
pkgdesc="An open source tool used to develop Polylith based architectures in Clojure"
arch=(any)
url='https://github.com/polyfy/polylith'
license=(EPL)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('java-runtime' 'git')
optdepends=('clojure: Lisp dialect for the JVM')
source=("${url}/releases/download/v${pkgver}-alpha/${_appname}-${pkgver}-alpha.tar.gz"
        'poly.sh')
sha256sums=('7fcb172f9f3f691662097f3f34ae87b00103a5063ef2941e035351b7cff99b08'
            'c6f68e93739d6021c0f9c307cebcf7f107192f96ee8b8f43cb7d3bb5e5b4c95f')
options=(!strip)

package() {
  cd "${srcdir}/${_appname}"
  install -d "${pkgdir}/usr/share/java/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -D -m644 poly*.jar "${pkgdir}/usr/share/java/${pkgname}/poly.jar"
  install -D -m755 "${srcdir}/poly.sh" "${pkgdir}/usr/share/java/${pkgname}/poly.sh"
  ln -sf "/usr/share/java/${pkgname}/poly.sh" "${pkgdir}/usr/bin/poly"
}
