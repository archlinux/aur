# Maintainer: Christian Erikson <bio.erikson@gmail.com>
pkgname=mcl
pkgver=14_137
pkgrel=1
pkgdesc="A unsupervised cluster algorithm for graphs based on simulation of flow in graphs."
arch=('i686' 'x86_64')
depends=('bash' 'perl')
url="https://www.micans.org/mcl/src/"
license=('GPL3')
source=("$url/$pkgname-${pkgver//_/-}.tar.gz")
md5sums=(bc8740456cf51019d0a9ac5eba665bb5)

build() {
        cd "$pkgname-${pkgver//_/-}"
        ./configure --prefix=/usr
        make clean
        make
}

check() {
        cd "$pkgname-${pkgver//_/-}"
        make check
}

package() {
        cd "$pkgname-${pkgver//_/-}"
        make DESTDIR="$pkgdir/" install
}

