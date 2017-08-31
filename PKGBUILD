# Maintainer: Luke Street <luke.street@encounterpc.com>
pkgname=flvmeta
pkgver=1.2.1
pkgrel=1
pkgdesc="A command-line utility aimed at manipulating Adobe(tm) Flash Video files (FLV)."
arch=('i386' 'x86_64')
url="https://www.flvmeta.com/"
license=('GPL')
depends=('glibc')
makedepends=('cmake')
source=("https://flvmeta.com/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4b48afc2db8b0ff1c86861bc09a58481bc241d93b879b6f915fbf695fc4bff51')

build() {
    cd "$pkgname-$pkgver"
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}

