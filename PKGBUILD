# Maintainer: Jonas Gunz <arch at jonasgunz dot de>
pkgname=otf-comic-shanns
_pkgname=comic-shanns
pkgver=r16.b98eee0
pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="a classy font"
makedepends=(git)
arch=('any')
url="https://github.com/shannpersand/comic-shanns"
license=('MIT')
source=("git+https://github.com/shannpersand/$_pkgname")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$_pkgname"

  # actual files
  install -Dt "$pkgdir"/usr/share/fonts/OTF v1/comic-shanns.otf

  # documentation
  install -Dt "$pkgdir"/usr/share/doc/"$pkgname" README.md

  # license
  install -Dt "$pkgdir"/usr/share/licenses/"$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
