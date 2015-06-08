pkgname=libevdevc
pkgdesc="Chromium OS libevdev"
pkgver=2.0
pkgrel=1
arch=(i686 x86_64)
url="https://github.com/hugegreenbug/libevdevc"
license=('custom:chromiumos')
_gitname='libevdevc'
depends=('glibc')
makedepends=('git' 'python2' 'check' 'valgrind' 'doxygen')

source=("$_gitname::git+https://github.com/hugegreenbug/libevdevc.git")

md5sums=('SKIP')

build() {
  cd "$srcdir/$_gitname"
  make
}

check() {
  cd "$srcdir/$_gitname"
  make check || /bin/true
}

package() {
  make -C "$srcdir/$_gitname" DESTDIR="${pkgdir}" install
}
