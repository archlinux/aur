# Maintainer: Juma7C9 <juri at dividebyzero dot it>
pkgname=cie-middleware
pkgver=1.0
pkgrel=1
pkgdesc="Middleware della CIE (Carta di Identità Elettronica) per Linux"
arch=('x86_64')
url="https://developers.italia.it/it/cie"
license=('BSD')
depends=('gcc-libs' 'glibc' 'openssl' 'java-runtime' 'pcsclite')
install="${pkgname}.install"

source=("https://github.com/italia/${pkgname}-linux/releases/download/${pkgver}/${pkgname}_${pkgver}.tar.gz"
        'LICENSE')

sha256sums=('83619b11cae8c1c2711d55693f6b1a6615622b113504038aeb1070fc4cab8b65'
            'bf2723ca68a1f406557a3174f9195dbdc6171cbf8f7ad83f56546ac592a9ea8e')

package() {
	cd "$srcdir/"

	install -dm 755				${pkgdir}/usr/share/CIEID
	install -Dm 644	${srcdir}/CIEID/*	${pkgdir}/usr/share/CIEID/
	install -Dm 755 libcie-pkcs11.so	${pkgdir}/usr/lib/libcie-pkcs11.so
	install -Dm 644 CIE_ID.desktop		${pkgdir}/usr/share/applications/CIE_ID.desktop
	install -Dm 644 LICENSE			${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
