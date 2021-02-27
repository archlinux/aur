# Maintainer: robertfoster
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-mm
pkgver=0.5.1
pkgrel=1
pkgdesc="OCaml multimedia library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-mm"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml' 'ocaml-alsa' 'ocaml-ao' 'ocaml-pulseaudio' 'ocaml-gstreamer' 'ocaml-mad' 'ocaml-ogg' 'ocaml-ocamlsdl' 'ocaml-theora' 'ffmpeg')
makedepends=('dune')
options=('!strip')
source=("https://github.com/savonet/ocaml-mm/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  dune build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  dune install --prefix "${pkgdir}/usr" \
    --libdir "${pkgdir}$(ocamlfind printconf destdir)"
}

sha256sums=('d03ed076bd084d19a9a747d129066c579b15915db9400d50e161ec09e03bf069')
