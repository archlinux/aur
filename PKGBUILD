# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=batsh
pkgver=0.0.6
pkgrel=1
license=('MIT')
arch=('i686' 'x86_64')
pkgdesc="A language that compiles to Bash and Windows Batch"
url="https://github.com/BYVoid/Batsh"
depends=('ocaml' 'ocaml-core' 'ocaml-ounit' 'ocaml-dlist' 'ocaml-cmdliner')
makedepends=('ocp-build')
source=("https://github.com/BYVoid/Batsh/archive/v${pkgver}.tar.gz")
options=('!strip')
md5sums=('aeb8a3a6b6c7c9de8b041dc9023b6a1a')

build() {
  cd "${srcdir}/Batsh-${pkgver}/src"

  ocp-build init  
  ocp-build build
}

package() {
  cd "${srcdir}/Batsh-${pkgver}/src"
  
  ocp-build install -install-destdir $pkgdir
}
