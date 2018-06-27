# Maintainer: Karol Babioch <karol@babioch.de

pkgname=dkgpg
pkgver=1.0.7
pkgrel=1
pkgdesc="The Distributed Privacy Guard (DKGPG) implements Distributed Key Generation (DKG) and Threshold Cryptography for OpenPGP."
arch=('x86_64')
url="http://www.nongnu.org/dkgpg/"
license=('GPL2')
depends=('libtmcg>=1.3.13' 'libgcrypt>=1.6.0' 'gmp')
source=("https://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('38675dd6b8078999a60b0b1df1182a115f11aa4f27398ce9cc58bef8f6ff6eae'
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

