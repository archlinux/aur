# Maintainer: Morten Linderud <morten@linderud.pw>

pkgname=archur-git
_pkgname=archur
pkgver=r13.dac0b59
pkgrel=1
pkgdesc="Arch linux wallpaper generator"
arch=("any")
url="https://github.com/Foxboron/archur"
license=('MIT')
depends=('python-pillow')
provides=('archur')
conflicts=('archur')
source=("git+https://github.com/Foxboron/archur.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm755 archur.py "$pkgdir/usr/bin/archur"
  install -Dm644 text.txt "$pkgdir/usr/share/archur/text.txt"
  install -Dm644 assets/logo.png "$pkgdir/usr/share/archur/assets/logo.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
