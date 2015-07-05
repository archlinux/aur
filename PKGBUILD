# Contributor: jorick <roels.jorick@gmail.com>
pkgname=universal-ctags-git
pkgver=20150705
pkgrel=1
pkgdesc="A maintained ctags implementation with support for more languages"
arch=('i686' 'x86_64')
url="https://github.com/universal-ctags/ctags/tree/master"
license=('GPL')
depends=('')
makedepends=('git')
provides=('ctags')
conflicts=('ctags')
source=("$pkgname::git+https://github.com/universal-ctags/ctags.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  autoreconf -vfi
  ./configure -prefix=/usr --sysconfdir=/etc
  make
}

package ()
{
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
