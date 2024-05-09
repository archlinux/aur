# Maintainer: UnkwUsr <ktoto2707043@gmail.com>
_progname='dalarma'
pkgname="${_progname}-git"
pkgver=r28.04f9d7b
pkgrel=1
pkgdesc="cli timer that forces you to get up from the computer"
arch=('any')
url="https://github.com/UnkwUsr/dalarma"
license=('MIT')
provides=("dalarma")
depends=('st' 'wmctrl' 'libnotify')
makedepends=('git')
conflicts=('dalarma')
source=("$pkgname::git+https://github.com/UnkwUsr/dalarma")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dm755 "dalarma" "$pkgdir/usr/bin/$_progname"

  install -Dm755 "usr/bin/fdalarma" "$pkgdir/usr/bin/fdalarma"
  install -Dm755 "usr/bin/dalarma-status" "$pkgdir/usr/bin/dalarma-status"
  install -Dm755 "usr/share/$_progname/utils.sh" "$pkgdir/usr/share/$_progname/utils.sh"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_progname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_progname/LICENSE"
}

