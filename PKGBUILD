# Maintainer: A.T.W.A. <arch.atwa@gmail.com>
# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=archivemount
pkgver=0.9.1
pkgrel=1
pkgdesc="FUSE based filesystem for mounting compressed archives"
arch=('i686' 'x86_64')
url="https://www.cybernoia.de/software/archivemount.html"
license=('GPL2')
depends=('fuse' 'libarchive')
source=("https://www.cybernoia.de/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c529b981cacb19541b48ddafdafb2ede47a40fcaf16c677c1e2cd198b159c5b3')

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
