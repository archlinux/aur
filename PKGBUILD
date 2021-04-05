# Maintainer: Maciej Łotysz <lotysz at gmail dot com>
pkgname=polylith-bin
_reponame=polylith
_pkgname=poly
pkgver=0.1.0
pkgrel=0
pkgdesc="an open source tool used to develop Polylith based architectures in Clojure"
arch=('i686' 'x86_64')
url="https://polylith.gitbook.io/polylith/"
license=('GPL')
depends=('java-runtime')
source=("https://github.com/polyfy/${_reponame}/releases/download/v${pkgver}-alpha9/${_pkgname}-${pkgver}-alpha9.tar.gz"
        'poly.sh')
md5sums=('7550db30cc8ffa5d04b9c5a4c9a6174c'
         '9a6c0517154d001356eeb9e732edbe22')

package() {
  cd "${srcdir}/${_pkgname}"

  install -d "${pkgdir}/usr/share/java/${pkgname}"
  install -d "${pkgdir}/usr/bin"

  install -D -m644 *.jar "${pkgdir}/usr/share/java/${pkgname}/poly.jar"

  install -D -m755 "${srcdir}/poly.sh" "${pkgdir}/usr/share/java/${pkgname}/poly.sh"
  ln -sf "/usr/share/java/${pkgname}/poly.sh" "${pkgdir}/usr/bin/poly"
}
