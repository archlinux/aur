# Maintainer: Leo <i@setuid0.dev>

pkgname=phan
pkgver=3.2.7
pkgrel=1
pkgdesc="Phan is a static analyzer for PHP that prefers to minimize false-positives."
url="https://github.com/phan/phan/wiki"
arch=("any")
license=("MIT")
depends=("php>=7.2.0")
optdepends=(
    "php-ast>=1.0.1: improved abstract syntax tree parsing"
)
source=(
    "${pkgname}-${pkgver}.phar::https://github.com/phan/phan/releases/download/${pkgver}/phan.phar"
    "https://raw.githubusercontent.com/phan/phan/${pkgver}/LICENSE"
)
sha256sums=(
    SKIP
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
