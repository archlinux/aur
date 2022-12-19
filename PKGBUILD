# Maintainer: basigur

pkgname=qcalcfilehash
pkgver=1.1.1
pkgrel=1
pkgdesc="Hash calculator (SHA1, SHA-224, SHA-256, SHA-384, SHA-512, MD5, CRC32, CRC8)"
arch=('x86_64')
url="https://bitbucket.org/admsasha/qcalcfilehash"
license=('GPLv3+')
depends=('qt5-base' 'openssl' 'glibc' 'gcc-libs' 'hicolor-icon-theme')
#optdepends=('openssl-gost-engine')
#makedepends=('qt5-tools')
source=("${url}/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('c11164799d0b8f0b48dcb449858e3270406b4e870be38dd87e153ccfe31b81f6c852641f20538b57a452d4eee9efde9b48ebaa17814adffd17dcad1248ef42a2')


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

