# Maintainer: Ferdinand B <theferdi265@gmail.com>

pkgname=pyvtlock-git
pkgver=1.0.1.r0.g336520c
pkgrel=1
pkgdesc="A python-based console locking program (git version)"
url="https://github.com/Ferdi265/pyvtlock"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python' 'pam' 'python-pam')
makedepends=('git')
source=("git+https://github.com/Ferdi265/pyvtlock")
md5sums=('SKIP')
install='pyvtlock.install'

pkgver() {
  cd "$srcdir/pyvtlock"
  git describe --long --tags | sed -r 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/pyvtlock"
    make
}

package() {
    cd "$srcdir/pyvtlock"
    make DESTDIR="$pkgdir" install
}
