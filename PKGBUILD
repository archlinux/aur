# Contributor: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=rutoken-pkcs
pkgver=2.17.5.0
pkgrel=3
pkgdesc='Интерфейс RSALabs PKCS#11'
arch=('x86_64')
url='https://www.rutoken.ru/support/download/pkcs/'
license=('custom:rutoken')
options=(!strip)

_file='librtpkcs11ecp.so'
source=("http://download.rutoken.ru/Rutoken/PKCS11Lib/${pkgver}/Linux/x64/librtpkcs11ecp_${pkgver}-1_amd64.deb")
sha256sums=('7382ece19a4e6642424db571600f00fccc5cf667eb23f0c90b88c487d7cbe44b')

package() {
	bsdtar -xf "${srcdir}/data.tar.xz"
	mkdir -p "${pkgdir}/usr/lib"
	cp -L "${srcdir}/opt/aktivco/rutokenecp/amd64/librtpkcs11ecp.so" "${pkgdir}/usr/lib"
	install -Dm644 "${srcdir}/usr/share/doc/rtpkcs11ecp/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
