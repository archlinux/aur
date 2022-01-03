# Maintainer: Luke Street <luke.street@encounterpc.com>
pkgname=flvmeta
pkgver=1.2.2
pkgrel=1
pkgdesc="A command-line utility aimed at manipulating Adobe(tm) Flash Video files (FLV)."
arch=('i386' 'x86_64')
url="https://www.flvmeta.com/"
license=('GPL')
depends=('glibc')
makedepends=('cmake')
source=("https://flvmeta.com/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a51a2f18d97dfa1d09729546ce9ac690569b4ce6f738a75363113d990c0e5118')

build() {
    cd "$pkgname-$pkgver"
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}

