# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Your Name <youremail@domain.com>

pkgname=ocp-build
pkgver=1.99.18_beta
pkgrel=1
pkgdesc="A build system for OCaml applications"
arch=('i686' 'x86_64')
url="http://www.typerex.org/ocp-build.html"
license=('GPL3')
depends=('ocaml')
source=("https://github.com/OCamlPro/ocp-build/archive/${pkgver/_/-}.tar.gz")
md5sums=('65cd6c06187f5cb197da61976d8c16ad')

build() {
  cd "${srcdir}/ocp-build-${pkgver/_/-}"

  ./configure
  make
}

package() {
  cd "${srcdir}/ocp-build-${pkgver/_/-}"

  make install prefix="${pkgdir}/usr"
  # No need for uninstall information - we're using a package manager
  find "${pkgdir}" -name "*.uninstall" -type f -delete
  rm "${pkgdir}/usr/lib/ocaml/installed.ocp"
}
