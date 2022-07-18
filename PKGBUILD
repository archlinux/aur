# Maintainer: William Gathoye <william + aur at gathoye dot be>

pkgname=dh-exec
pkgver=0.23
pkgrel=2
pkgdesc='Debhelper executable file substition helpers'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/algernon/dh-exec'
license=('GPL3')

makedepends=('autoconf')
optdepends=(
)
source=(
    "https://git.madhouse-project.org/archive/dh-exec/archive/dh-exec-${pkgver}.tar.gz"
)
sha512sums=(
    'b9df73beb5044e5447165bf69892f1b3014ffd132613141e84d38dc5aa2ae868f1e35db1908fe649392a773c4fd94194ccd49387cb706c94df00d0d55751f4e7'
)

build() {
    cd "${pkgname}"
    autoreconf --install
    ./configure --prefix=/usr --libexecdir=/usr/lib
    make
}

package() {
    cd "${pkgname}"
    make install DESTDIR="${pkgdir}"
}
