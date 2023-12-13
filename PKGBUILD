# Maintainer: Ferdinand B <theferdi265@gmail.com>

pkgname=pyvtlock-git
pkgver=1.1.5.r1.g7aa133f
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
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/pyvtlock"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/pyvtlock"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
