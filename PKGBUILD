# Maintainer : Kipras Melnikovas (sarpik)  $(curl -L go.kipras.org/email)

pkgname=git-backup-git
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r45.gd5a03aa
pkgrel=1

pkgdesc="Remote git stash, in case of fire and more!"
arch=("any")
url="https://github.com/sarpik/git-backup"
license=("GPL2")

provides=()
conflicts=("${pkgname%-git}")
# git-backup is a different package.
#provides=("${pkgname%-git}")
#conflicts=("${pkgname%-git}")

makedepends=()
depends=("git")

options=()

install="${pkgname%-git}.install"
#changelog=
source=("git+$url")
sha256sums=("SKIP")

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" -s install
  install -Dm644 -t "$pkgdir/usr/share/doc/${pkgname%-git}/" README.md
}

# vim: ts=2 sw=2 et ft=PKGBUILD:

