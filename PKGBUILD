# Maintainer: Karol Babioch <karol@babioch.de

pkgname=dkgpg
pkgver=1.0.4
pkgrel=2
pkgdesc="The Distributed Privacy Guard (DKGPG) implements Distributed Key Generation (DKG) and Threshold Cryptography for OpenPGP."
arch=('x86_64')
url="http://www.nongnu.org/dkgpg/"
license=('GPL2')
depends=('libtmcg' 'libgcrypt' 'gmp')
source=("http://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('65e9d0ae7f6a56f441989b194dddcf16b84bc44faa8935a3501ce776238d23dd'
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

