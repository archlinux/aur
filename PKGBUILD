# Maintainer: Oliver Hattshire <hattshire at gmail dot com>
# Font Author: 0xcf843ecf802c722f434d56 <nathanwoodformal at gmail dot com>

_basename=inupiaqnumbers
_pkgbase=ttf-${_basename}
pkgname=${_pkgbase}-git
pkgver=r5.69d01c0
pkgrel=1
pkgdesc='A font for displaying Inupiaq numerals. It uses from U+E5A0 to U+E5B3.'
url="https://github.com/0xcf843ecf802c722f434d56/${_basename}"
license=('MIT')
arch=('any')
depends=()
makedepends=()
optdepends=()
provides=()
source=("git+https://github.com/0xcf843ecf802c722f434d56/${_basename}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_basename}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_basename}"
  find . -iname '*.ttf' -execdir install -Dm644 {} $pkgdir/usr/share/fonts/TTF/{} \;
}
