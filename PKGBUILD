# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>

_pkgname=po4a-bulk
pkgname=$_pkgname-git
pkgver=r1.dd13075
pkgrel=1
pkgdesc="Automation wrappers for po4a"
arch=('i686' 'x86_64')
url="https://github.com/vorot93/po4a-bulk"
license=('GPL-3.0-only')
makedepends=('git')
depends=('po4a')
provides=("$_pkgname")
source=("git+https://github.com/vorot93/$_pkgname.git")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 po4a-bulk-gettextize "$pkgdir/usr/bin/po4a-bulk-gettextize"
  install -Dm755 po4a-bulk-translate "$pkgdir/usr/bin/po4a-bulk-translate"
  install -Dm755 po4a-bulk-updatepo "$pkgdir/usr/bin/po4a-bulk-updatepo"
}
