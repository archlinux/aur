# Maintainer: lucy <lucy@luz.lu>

pkgname=bdf-tewi-git
_gitname=tewi-font
pkgver=0.241.52b550c
pkgrel=1
pkgdesc='Bitmap font'
arch=('any')
url="https://github.com/lucy/tewi-font"
license=('MIT')
depends=('xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('git')
install="$pkgname.install"
source=('git+https://github.com/lucy/tewi-font.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
  cd "$_gitname"
  install -T -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d -m755 "$pkgdir/usr/share/fonts/misc/"
  install -m644 -t "$pkgdir/usr/share/fonts/misc/" \
    "tewi-bold-11.bdf" "tewi-medium-11.bdf" \
    "tewi2a-bold-11.bdf" "tewi2a-medium-11.bdf" \
    "tewifw-bold-11.bdf" "tewifw-medium-11.bdf"
}
