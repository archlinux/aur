# Maintainer:  kngfr <9bcfbc1ca230857ba09584697f20708a@kngfr.de>
pkgname=git-blame-someone-else
pkgver=r18.8d854c2
pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Blame someone else for your bad code."
arch=('any')
url="https://github.com/jayphelps/git-blame-someone-else"
license=('MIT')
depends=('git' 'python')
#makedepends=('coreutils')
source=("git+https://github.com/jayphelps/$pkgname")
sha1sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"

  # actual file(s)
  install -Dt "$pkgdir"/usr/bin/ "$pkgname"

  # license file
  install -Dt "$pkgdir"/usr/share/licenses/"$pkgname"/ LICENSE

  # documentation
  install -Dt "$pkgdir"/usr/share/doc/"$pkgname"/  README.md
}

# vim:set ts=2 sw=2 et:
