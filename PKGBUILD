# Maintainer:  <kngfr> 9bcfbc1ca230857ba09584697f20708a@kngfr.de
pkgname=autoi3
pkgver=r7.f6cac83
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
epoch=
pkgdesc="A couple of helper scripts for i3"
arch=('any')
url="https://gitlab.com/lejs/autoi3"
license=('MIT')
depends=('python3')
source=("git+https://gitlab.com/lejs/autoi3")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"

  # actual program files
  # TODO maybe rename or symlink .py files to their basename
  install -D -t "$pkgdir"/usr/share/"$pkgname" *.py

  # documentation
  install -D -t "$pkgdir"/usr/share/doc/"$pkgname"/ README.md
  
  # license
  install -D -t "$pkgdir"/usr/share/licenses/"$pkgname" LICENSE 
}

# vim:set ts=2 sw=2 et:
