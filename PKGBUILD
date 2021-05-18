# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
_pkgname=xiate
pkgname=$_pkgname-git
pkgver=20.07.32.gc9e4342
pkgrel=1
pkgdesc="xiate is a terminal emulator"
arch=('i686' 'x86_64')
url="https://uninformativ.de/git/xiate"
license=('MIT')
depends=('vte3')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+https://uninformativ.de/git/xiate.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g; s|v||'
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" prefix="/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
