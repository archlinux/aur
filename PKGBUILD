# Contributor: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=rutoken-pkcs
pkgver=2.18.1.0
pkgrel=1
pkgdesc='Интерфейс RSALabs PKCS#11'
arch=('x86_64')
url='https://www.rutoken.ru/support/download/pkcs/'
license=('custom:rutoken')
options=(!strip)

_file='librtpkcs11ecp.so'
source=("http://download.rutoken.ru/Rutoken/PKCS11Lib/${pkgver}/Linux/x64/librtpkcs11ecp_${pkgver}-1_amd64.deb")
sha256sums=('f0b8f28611fa508c9f4a48e2a2a3e4da3d81d04b2fae94ef9a3b9b6b75e1d281')

package() {
	bsdtar -xf "${srcdir}/data.tar.xz"
	mkdir -p "${pkgdir}/usr/lib"
	cp -L "${srcdir}/opt/aktivco/rutokenecp/amd64/librtpkcs11ecp.so" "${pkgdir}/usr/lib"
	install -Dm644 "${srcdir}/usr/share/doc/rtpkcs11ecp/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
