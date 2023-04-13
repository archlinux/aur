# Maintainer: Leo <i@setuid0.dev>

pkgname=phpstan
pkgver=1.10.13
pkgrel=1
pkgdesc="PHP Static Analysis Tool"
url="https://phpstan.org/"
arch=("any")
license=("MIT")
depends=("php>=7.2.0")
optdepends=()

source=(
    "${pkgname}-${pkgver}.phar::https://github.com/phpstan/phpstan/releases/download/${pkgver}/phpstan.phar"
    "https://raw.githubusercontent.com/phpstan/phpstan/${pkgver}/LICENSE"
)
sha256sums=(
	'c0506ba4c298bfe06af1c4a12e03aafdf391cfbeda06310449a5f303e864dc6f'
	SKIP
)

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
