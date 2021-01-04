# Maintainer:  Andy Mender <andymenderunix@gmail.com>
# Contributor: Andy Mender <andymenderunix@gmail.com>
pkgname="nuklear-git"
pkgver=r1857.4a74982
pkgrel=1
pkgdesc="A header-only, immediate-mode GUI toolkit written in ANSI C"
arch=('any')
url="https://github.com/Immediate-Mode-UI/Nuklear"
license=('MIT')
depends=()
makedepends=('git')
source=('nuklear-git::git+https://github.com/Immediate-Mode-UI/Nuklear.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Install headers
  mkdir -p "$pkgdir/usr/include"
  install -m644 "$pkgname/nuklear.h" "$pkgdir/usr/include/nuklear.h"

  # Install README and license (embedded in README)
  for _docdir in doc licenses
  do
    mkdir -p "$pkgdir/usr/share/$_docdir/$pkgname"
    install -m644 "$pkgname/Readme.md" "$pkgdir/usr/share/$_docdir/$pkgname/Readme.md"
  done

}
