# Maintainer: Maciej Łotysz <lotysz at gmail dot com>

_appname=poly
pkgname=polylith-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="An open source tool used to develop Polylith based architectures in Clojure"
arch=(any)
url='https://polylith.gitbook.io/polylith'
license=(EPL)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('java-runtime' 'git')
optdepends=('clojure: Lisp dialect for the JVM')
source=("${url}/releases/download/v${pkgver}-alpha9/${_appname}-${pkgver}-alpha9.tar.gz"
        'poly.sh')
sha256sums=('2f809c583b0bf6421ee3837c97ec329b396d6c5ba4e287cfb8f3cf7ec8ec0baf'
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
