# Maintainer : Frederik “Freso” S. Olesen <freso.dk@gmail.com>

_pkgname=dh-dyndns
pkgname=$_pkgname-git
pkgver=0.2.r1.66b7d75
pkgrel=2
pkgdesc='Dynamic DNS script for DreamHost'
arch=('any')
url='https://github.com/pissedoffadmins/dh-dyndns'
license=('GPL3')
depends=('bash' 'wget')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s.r%s.%s" "$(grep 'local VER' /usr/bin/dh-dyndns|cut -d\" -f 2)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 dh-dyndns "$pkgdir/usr/bin/dh-dyndns"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${_pkgname}/README.md"
}
