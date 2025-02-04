# Maintainer: robertfoster
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-pulseaudio
pkgver=0.1.5 # renovate: datasource=github-tags depName=savonet/ocaml-pulseaudio
pkgrel=1
pkgdesc="OCaml bindings for pulseaudio"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-pulseaudio"
license=('LGPL2.1')
depends=('ocaml' 'libpulse')
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

sha256sums=('80c5c6066375727d6647e736ed27b9610321b5952d6b5fba6152908ca9356c74')
