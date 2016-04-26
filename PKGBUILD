# Maintainer: Morten Linderud <morten@linderud.pw>

pkgname=archur-git
_pkgname=archur
pkgver=r12.ba5c048
pkgrel=1
pkgdesc="Arch linux wallpaper generator"
arch=("any")
url="https://github.com/Foxboron/archur"
license=('MIT')
depends=('python-pillow')
source=("git+https://github.com/Foxboron/archur.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "$srcdir/$_pkgname/archur.py" "$pkgdir/usr/bin/archur"
  install -Dm644 "$srcdir/$_pkgname/text.txt" "$pkgdir/usr/share/archur/text.txt"
  install -Dm644 "$srcdir/$_pkgname/assets/logo.png" "$pkgdir/usr/share/archur/assets/logo.png"
}

# vim:set ts=2 sw=2 et:
