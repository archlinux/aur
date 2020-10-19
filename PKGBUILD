# Maintainer: Juri Vitali <juri@dividebyzero.it>

pkgname=efiedit
pkgver=1.0.1
pkgrel=1
pkgdesc="Efibootmgr wrapper to view and edit boot entries"
arch=('i686' 'x86_64')
url="https://github.com/Juma7C9/Efiedit"
license=('GPL3')
depends=('efibootmgr')
options=('strip')
source=("https://github.com/Juma7C9/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('428218f8bcfa1d5a2e00aece83a17c45538eda1460afb8cf7b55ea5aedd233e1')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm 0755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm 0644 "example.conf" "${pkgdir}/usr/lib/${pkgname}/${pkgname}.conf.example"
	install -Dm 0644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
