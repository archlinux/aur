# Maintainer: basigur

pkgname=qcalcfilehash
pkgver=1.0.7
pkgrel=1
pkgdesc="Hash calculator (SHA1, SHA-224, SHA-256, SHA-384, SHA-512, MD5, CRC32, CRC8)"
arch=('x86_64')
url="https://bitbucket.org/admsasha/qcalcfilehash"
license=('GPLv3+')
depends=('qt5-base' 'openssl' 'glibc' 'gcc-libs' 'hicolor-icon-theme')
#makedepends=('qt5-tools')
source=("https://bitbucket.org/admsasha/qcalcfilehash/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('ebf4ec55028c28e1da1934cc6b2ac292aa7cd63194835a5683f4a81b0a70e8d2429e86d82528235f8b7bb5eae68b648ebf0006f45a7c93ca16b04473dc192db5')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	qmake-qt5
	make
}


package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make INSTALL_ROOT="${pkgdir}" install
	install -Dm644 'README.md' "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

