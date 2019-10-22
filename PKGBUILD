# Maintainer: basigur

pkgname=qcalcfilehash
pkgver=1.0.6
pkgrel=1
pkgdesc="Hash calculator (SHA1, SHA-224, SHA-256, SHA-384, SHA-512, MD5, CRC32, CRC8)"
arch=('x86_64')
url="https://bitbucket.org/admsasha/qcalcfilehash"
license=('GPLv3+')
depends=('qt5-base' 'openssl' 'glibc' 'gcc-libs' 'hicolor-icon-theme')
#makedepends=('qt5-tools')
source=("https://bitbucket.org/admsasha/qcalcfilehash/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('eb2e8db9c026ef2c238863eee3fd201e0860a52edc27dc8c208f7b81bbeb1d23db21f128e188c380b72496a46f0a2e05c8bbc13c2d7aa4336d54998b0334130b')


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

