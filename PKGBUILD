# Maintainer: Karol Babioch <karol@babioch.de

pkgname=dkgpg
pkgver=1.0.5
pkgrel=1
pkgdesc="The Distributed Privacy Guard (DKGPG) implements Distributed Key Generation (DKG) and Threshold Cryptography for OpenPGP."
arch=('x86_64')
url="http://www.nongnu.org/dkgpg/"
license=('GPL2')
depends=('libtmcg' 'libgcrypt' 'gmp')
source=("https://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('d802d50d832decb6ed9ec4b1c24610d34892da3dd431a71e4ad0bf37dc26dceb'
            'SKIP')
validpgpkeys=("76F73011329D27DB8D7C3F974F584EB8FB2BE14F")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

