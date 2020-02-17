# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at pm dot me>
pkgname=pnglatex
pkgver=7f8ca12
pkgrel=1
pkgdesc="Small script to turn LaTeX formulas into png images"
arch=('any')
url="https://github.com/mneri/pnglatex"
license=('GPL3')
depends=('texlive-bin' 'imagemagick' 'optipng')
optdepends=('xorg-xdpyinfo: get dpi resolution of screen')
provides=("pnglatex")
conflicts=('pnglatex')
md5sums=('SKIP')
source=("$pkgname::git+https://github.com/mneri/pnglatex")

pkgver() {
  cd "$pkgname"
  echo $(git describe --always | sed 's/-/./g')
}

package() {
  cd "$pkgname"
  install -Dm755 "pnglatex" "${pkgdir}/usr/bin/pnglatex"
  install -Dm755 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
