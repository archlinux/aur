# Maintainer: elsorino <elso at pm dot me>
pkgname=fontpreview
pkgver=r10.15d17ed
pkgrel=1
pkgdesc="CLI tool to preview fonts"
arch=('any')
url="https://github.com/sdushantha/fontpreview"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
depends=(
  'xdotool'
  'fzf'
  'imagemagick'
  'sxiv'
  )
makedepends=('git')
source=("git://github.com/sdushantha/fontpreview.git")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname/"
  make DEST="$pkgdir/" install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/fontpreview/LICENSE.md"
}