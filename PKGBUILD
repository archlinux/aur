# Maintainer: Lucas Rooyakkers <lucas dot rooyakkers at pm dot me>
_pkgname=pnglatex
pkgname=pnglatex-git
pkgver=r142.48cc55d
pkgrel=1
pkgdesc="Small script to turn LaTeX formulas into png images"
arch=('any')
url="https://github.com/mneri/pnglatex"
license=('GPL3')
depends=('texlive-bin' 'imagemagick' 'optipng')
makedepends=('git')
optdepends=('xorg-xdpyinfo: get dpi resolution of screen')
provides=("pnglatex")
conflicts=('pnglatex')
replaces=('pnglatex<=r142.48cc55d')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm755 "pnglatex" "${pkgdir}/usr/bin/pnglatex"
  install -Dm755 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
