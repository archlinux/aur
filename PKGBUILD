# Maintainer: Juma7C9 <juri at dividebyzero dot it>

pkgname=cie-middleware
pkgver=1.3.0
pkgrel=1
pkgdesc="Middleware della CIE (Carta di Identità Elettronica) per Linux"
arch=('x86_64')
url="https://developers.italia.it/it/cie"
license=('BSD')
depends=('gcc-libs' 'glibc' 'openssl' 'java-runtime' 'pcsclite')
install="${pkgname}.install"

source=("https://github.com/italia/${pkgname}-linux/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'LICENSE')

sha256sums=('12377fd035da98d985e4b0c2a5318390e6e812d129ba51ebe25c69e92220f2e3'
            'bf2723ca68a1f406557a3174f9195dbdc6171cbf8f7ad83f56546ac592a9ea8e')

package() {
	cd "${srcdir}/${pkgname}_${pkgver}"

	install -dm 755				${pkgdir}/usr/share/CIEID
	install -Dm 644	CIEID/*			${pkgdir}/usr/share/CIEID/
	install -Dm 755 libcie-pkcs11.so	${pkgdir}/usr/lib/libcie-pkcs11.so
	install -Dm 644 cieid.desktop		${pkgdir}/usr/share/applications/cieid.desktop
	install -Dm 644 ../LICENSE		${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
