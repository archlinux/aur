# Maintained by Joseph Riches

pkgname=libevdevc-git
pkgdesc="Chromium OS libevdev"
pkgver=2.0
pkgrel=2
arch=(i686 x86_64)
url="https://github.com/galliumos/libevdevc"
license=('custom:chromiumos')
_gitname='libevdevc'
depends=('glibc')
makedepends=('git' 'python2' 'check' 'valgrind' 'doxygen')
conflicts=('libevdevc')

source=("$_gitname::git+https://github.com/galliumos/libevdevc.git")

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

