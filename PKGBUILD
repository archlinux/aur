# Maintainer: Leo <i@hardrain980.com>

pkgname=phan
pkgver=5.5.0
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
sha256sums=('b5ab57540b903a0cf52e0ee6d05e8f5d897dc88b8c6ee4934cadb4426068b12b' SKIP)

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

