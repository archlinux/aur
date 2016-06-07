# Maintainer: Márk Sági-Kazár <mark.sagi-kazar@gmail.com>

pkgname=php-build
pkgver=0.10.0
pkgrel=5
pkgdesc="Install PHP versions"
arch=("any")
url="https://github.com/php-build/php-build"
license=("MIT")
depends=("libmcrypt" "gmp" "tidyhtml")
conflicts=("${pkgname}-git")
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=("fe93bff7b564d0ba05a672b663568e09")

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	PREFIX="$pkgdir/usr" ./install.sh
	rm "${pkgdir}/usr/bin/rbenv-install"
}
