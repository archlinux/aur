# Maintainer: dreieck

_pkgname=ttf-revelation
pkgname="${_pkgname}"
pkgver=latest
pkgrel=2
pkgdesc="The hand-written font for Myst IV Revelation journals."
arch=('any')
url="http://www.rshayter.com/downloads/"
license=('custom')

depends=(
)

makedepends=(
  "fontconfig"
  "xorg-mkfontscale"
  "xorg-mkfontdir"
  "xorg-xset"
)

install='revelation.install'

source=(
  "Revelation.ttf::http://www.rshayter.com/files/Revelation.ttf"
  "license-dummy.txt"
  "${install}"
)

sha256sums=(
  "0e0fde843486d814f3831f9f482884543d315e90e05cb539e8a6bce678b88c74"
  "SKIP"
  "SKIP"
)

prepare() {
  cd "${srcdir}"
  echo "${url}" > "${srcdir}/website.url"
}

package() {
  cd "${srcdir}"

  install -D -v -m644 'Revelation.ttf' "${pkgdir}/usr/share/fonts/revelation/Revelation.ttf"

  install -D -v -m644 license-dummy.txt "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
  install -D -v -m644 website.url "${pkgdir}/usr/share/doc/${_pkgname}/website.url"
}
