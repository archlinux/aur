# Maintainer: robertfoster
pkgname=ocaml-fdkaac-git
pkgver=r80.cc4245a
pkgrel=1
pkgdesc="OCaml binding for the fdk-aac library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-fdkaac"
license=('GPL')
depends=('ocaml' 'libfdk-aac')
makedepends=('dune' 'dune-configurator')
options=('!strip' '!makeflags')
source=("${pkgname}::git+https://github.com/savonet/ocaml-fdkaac.git")

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"  
    dune build    
}

package() {
    cd "${srcdir}/${pkgname}"
    dune install --prefix "${pkgdir}/usr" \
    --libdir "${pkgdir}$(ocamlfind printconf destdir)"
}

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

md5sums=('SKIP')
