# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-lwt_log
pkgver=1.1.1
pkgrel=1
pkgdesc="Lwt-friendly logger"
arch=('x86_64')
url='https://github.com/aantron/lwt_log'
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml' 'ocaml-lwt')
makedepends=('dune')
options=('!strip')
source=("https://github.com/aantron/lwt_log/archive/${pkgver}.tar.gz")
sha512sums=('df3d171a7c72f37e96b756d252ab586767df9c13e01500faf13d4b2cee936b0602fd7c725c03db488d3737d8d92300af103d395a926dc654a2c44a5d6068f24a')

build() {
  cd "${srcdir}/lwt_log-${pkgver}"

  dune build --profile release
}


package() {
  cd "${srcdir}/lwt_log-${pkgver}"

  dune install --destdir "${pkgdir}"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
