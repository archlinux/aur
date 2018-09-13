# Maintainer: Karol Babioch <karol@babioch.de

pkgname=dkgpg
pkgver=1.0.8
pkgrel=1
pkgdesc="The Distributed Privacy Guard (DKGPG) implements Distributed Key Generation (DKG) and Threshold Cryptography for OpenPGP."
arch=('x86_64')
url="http://www.nongnu.org/dkgpg/"
license=('GPL2')
depends=('libtmcg>=1.3.14' 'libgcrypt>=1.6.0' 'gmp' 'zlib' 'bzip2')
source=("https://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('3594a4ade2bbdfa1cdda7ffd4ce6c4d68b0d4eea823c5c5ab51f3e8249df37c4'
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

