# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

pkgname=ocaml-zed
pkgver=2.0.3
pkgrel=1
pkgdesc="An abstract engine for text editing"
arch=('i686' 'x86_64')
url='https://github.com/diml/zed'
license=('BSD')
depends=('ocaml' 'ocaml-camomile' 'ocaml-react' 'ocaml-charinfo_width')
makedepends=('dune')
options=('!strip')
source=("https://github.com/diml/zed/archive/${pkgver}.tar.gz")
sha512sums=('b1c790d2a0d0b6fe8d43a718716910ebb38c16a8adad553f08120dfb653da971312ce760d68efb458b662bc8c39c60c46b9c3e951f61535f7972b444f4eabdbc')

build() {
  cd "${srcdir}/zed-${pkgver}"

  dune build --profile release
}


package() {
  cd "${srcdir}/zed-${pkgver}"

  dune install --destdir "${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
