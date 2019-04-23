# Maintainer: A.T.W.A. <arch.atwa@gmail.com>
# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=archivemount
pkgver=0.8.12
pkgrel=2
pkgdesc="FUSE based filesystem for mounting compressed archives"
arch=('i686' 'x86_64')
url="https://www.cybernoia.de/software/archivemount.html"
license=('GPL2')
depends=('fuse' 'libarchive')
source=("https://www.cybernoia.de/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('247e475539b84e6d2a13083fd6df149995560ff1ea92fe9fdbfc87569943cb89')

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
