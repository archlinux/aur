# Maintainer: Witalij Berdinskich <radio_rogal at keemail dot me>

pkgname=generator-mozu-actions
pkgver=1.3.0
pkgrel=1
pkgdesc='Yeoman generator for Mozu Actions scaffolding'
arch=('any')
url='https://github.com/Mozu/generator-mozu-actions'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Mozu/generator-mozu-actions/archive/v${pkgver}.tar.gz")
options=(!strip)
noextract=("${pkgname}-${pkgver}.tar.gz")
md5sums=('d004b8ebaebf6574ab1d8b0a84c4c832')
sha256sums=('a19a5210279cb83412a26ca9083c0472adbe77135eebf6390856e414bdb8c565')

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +
	chown -R root:root "${pkgdir}"
	install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
