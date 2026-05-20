# Contributor: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=rutoken-pkcs11
pkgver=2.19.0.0
pkgrel=1
pkgdesc='Интерфейс RSALabs PKCS#11'
arch=('x86_64')
url='https://www.rutoken.ru/support/download/pkcs/'
license=('custom:rutoken')
options=(!strip)

_file='librtpkcs11ecp.so'
source=("http://download.rutoken.ru/Rutoken/PKCS11Lib/${pkgver}/Linux/x64/librtpkcs11ecp_${pkgver}-1_amd64.deb")
sha256sums=('6cf9fe1209bc5bcddcc0765171cc6e261a2af43b08e1c3d44f6ff300204934a2')

package() {
	bsdtar -xf "${srcdir}/data.tar.xz"
	mkdir -p "${pkgdir}/usr/lib"
	cp -L "${srcdir}/opt/aktivco/rutokenecp/amd64/librtpkcs11ecp.so" "${pkgdir}/usr/lib"
	install -Dm644 "${srcdir}/usr/share/doc/rtpkcs11ecp/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
