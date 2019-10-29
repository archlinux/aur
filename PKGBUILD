# Maintainer : Kipras Melnikovas (sarpik)  $(curl -L go.kipras.org/email)

pkgname=git-backup-git
pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r37.gdd67138
pkgrel=1

pkgdesc="Remote git stash, in case of fire and more!"
arch=("any")
url="https://github.com/sarpik/git-backup"
license=("GPL2")

provides=("${pkgname}")
# conflicts=("${pkgname%-git}") # git-backup is a different package

makedepends=()
depends=("git")

options=()

install="${pkgname}.install"
#changelog=
source=("git+$url")
sha256sums=("SKIP")

package() {
  cd "$srcdir/${pkgname}"
  make DESTDIR="$pkgdir" -s install
  install -Dm644 -t "$pkgdir/usr/share/doc/${pkgname}/" README.md
}

# vim: ts=2 sw=2 et ft=PKGBUILD:

