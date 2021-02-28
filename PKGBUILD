# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-gstreamer
pkgver=0.3.1
pkgrel=1
pkgdesc="OCaml bindings for the GStreamer multimedia framework"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-gstreamer"
license=('LGPL2.1')
depends=('ocaml' 'gstreamer' 'gst-plugins-base')
options=('!strip')
makedepends=('ocaml-findlib' 'dune')
options=('!strip')
source=("${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "lib/ocaml"

  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}

sha256sums=('e13f105d6fcd3843223ee09b501f40fc1ad2e63175a1382793f4c1db9fb51b21')
