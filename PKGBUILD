# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ffmpeg
pkgver=0.4.3
pkgrel=1
pkgdesc="OCaml bindings to the FFmpeg library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-ffmpeg"
license=('LGPL2.1')
depends=('ocaml' 'ffmpeg')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-ffmpeg/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./bootstrap
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}/stublibs"
  make install
}

sha512sums=('f55fbfab62998366e56827f2a5a5190e788c44a4f3dc214218fa702a6a6ad891adb1dc7cadf811cd999664ce01be2891b865010ee81bac56fe95bc7651549f19')
