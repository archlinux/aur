# Maintainer: Tim Diels <timdiels.m@gmail.com>
pkgname=('redo-git')
pkgdesc="Smaller, easier, more powerful, and more reliable than make. An implementation of djb's redo."
pkgver='redo.0.11.r0.g33dadbf'
pkgrel=1
url='https://github.com/apenwarr/redo'
license=('GPL')
arch=('any')
depends=(python2)
makedepends=(git)
source=("git+https://github.com/apenwarr/redo.git")
md5sums=(SKIP)  # fill with updkpkgsums
conflicts=('redo')
provides=('redo')

pkgver() {
    cd "redo"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "redo"
    make DESTDIR="$pkgdir/" install
}

