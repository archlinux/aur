# Maintainer: Butui Hu <hot123tea123@gmail.com>

_pkgname=latexdraw
pkgname=latexdraw-bin
pkgver=4.0.3
pkgrel=1
pkgdesc='A vector drawing editor for LaTeX (JavaFX)'
arch=('x86_64')
url='http://latexdraw.sourceforge.net'
license=('GPL3')
depends=(
  freetype2
  libnet
  java-runtime
)
makedepends=(
  dpkg
)
optdepends=(
  'ttf-droid: font for CJK characters'
)
provides=(latexdraw)
conflicts=(latexdraw)
source=("${_pkgname}-${pkgver}.deb::https://sourceforge.net/projects/latexdraw/files/latexdraw/${pkgver}/latexdraw_${pkgver}-1_amd64.deb")
sha512sums=('9c3e1d2ddf2635a6d5f89b19b55d0a116f21a8b1d9e334622d2d37d487e6aeae0e97813f339f42af7b08529c6a3211fc8559fc0d0ca48d66144977f5f13027dd')

package() {
  dpkg -x "${_pkgname}-${pkgver}.deb" "${pkgdir}"
  install -d ${pkgdir}/usr/bin
  ln -sf "/opt/latexdraw/bin/LaTeXDraw" "${pkgdir}/usr/bin/LaTeXDraw"
  install -Dm644 "${pkgdir}/opt/latexdraw/lib/latexdraw-LaTeXDraw.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
# vim:set ts=2 sw=2 et:

