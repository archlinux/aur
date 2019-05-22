# Maintainer: kngfr <9bcfbc1ca230857ba09584697f20708a@kngfr.de>
pkgname=sudont
pkgver=r5.43cf8b3
pkgrel=1
pkgdesc="Grants superuser permission, then does nothing"
arch=('i686' 'x86_64')
url="https://github.com/cbondurant/sudont"
license=('MIT')
depends=('bash')
makedepends=('gcc')
source=("git+https://github.com/cbondurant/sudont")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/$pkgname"

  gcc -Wall -Wextra dont.c -O3 -o dont
}

package() {
  cd "$srcdir/$pkgname"

  install -D -t "$pkgdir"/usr/bin dont sudont
  install -D -t "$pkgdir"/usr/share/licenses/"$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
