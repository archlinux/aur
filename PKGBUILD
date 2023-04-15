# Maintainer: Alad Wenter <https://github.com/AladW>
pkgname=aurum-git
pkgver=0.1.r0.g9eabd0e
pkgrel=1
pkgdesc='high-level wrapper for aurutils with extra features'
url='https://github.com/AladW/aurum'
arch=('any')
license=('custom:ISC')
source=('git+https://github.com/AladW/aurum')
sha256sums=('SKIP')
conflicts=('aurum')
provides=("aurum=${pkgver%%.r*}")
depends=('git' 'aurutils' 'bat' 'git-delta' 'ninja')
makedepends=('git')

pkgver() {
    cd aurum
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
    cd aurum
    make
}

package() {
    cd aurum
    make DESTDIR="$pkgdir" install
}
