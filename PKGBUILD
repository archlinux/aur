# Maintainer: Leo <i@hardrain980.com>

pkgname=phan
pkgver=5.5.1
pkgrel=1
pkgdesc="Static analyzer for PHP that prefers to minimize false-positives."
url="https://github.com/phan/phan/wiki"
arch=("any")
license=("MIT")
depends=("php>=7.2.0" "php-ast>=1.0.16")
source=(
	"${pkgname}-${pkgver}.phar::https://github.com/phan/phan/releases/download/${pkgver}/phan.phar"
	"https://raw.githubusercontent.com/phan/phan/${pkgver}/LICENSE"
)
sha256sums=('ef76437e0be14a8705fc59a33a5fd3c3de6db26586e1c364b65b20cfb5c8f7ab' SKIP)

package() {
	install -D -m 644 \
		"${srcdir}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -D -m 755 \
		"${srcdir}/${pkgname}-${pkgver}.phar" \
		"${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"

	install -d "${pkgdir}/usr/bin"

	ln -s \
		"/usr/share/webapps/bin/${pkgname}.phar" \
		"${pkgdir}/usr/bin/${pkgname}"
}
