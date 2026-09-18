# Maintainer: Marco Righi <marco.righi@cnr.it>

pkgname=sendemail-safe
pkgver=1.0.1
pkgrel=1
pkgdesc="SMTP command-line tools that keep credentials out of process command lines"
arch=('any')
url="https://github.com/marcorighi/sendEmail-safe"
license=('MIT')
depends=('bash' 'python')

source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=('6ca21d5c04fcc84ce464df79ba078963361df40b916bae9ca9ac48182add2e24')

check() {
    cd "${srcdir}/sendEmail-safe-${pkgver}"

    ./run-tests.sh
}

package() {
    cd "${srcdir}/sendEmail-safe-${pkgver}"

    install -Dm755 \
        sendEmail-safe.py \
        "${pkgdir}/usr/bin/sendEmail-safe.py"

    install -Dm755 \
        sendEmail-safe-configure.py \
        "${pkgdir}/usr/bin/sendEmail-safe-configure.py"

    install -Dm755 \
        sendEmail-safe-migrate.py \
        "${pkgdir}/usr/bin/sendEmail-safe-migrate.py"

    install -Dm644 \
        README.md \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 \
        sendEmail-safe-README.txt \
        "${pkgdir}/usr/share/doc/${pkgname}/sendEmail-safe-README.txt"

    install -Dm644 \
        CHANGELOG.md \
        "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

    install -Dm644 \
        SECURITY.md \
        "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"

    install -Dm644 \
        sendemail-safe-profile.schema.json \
        "${pkgdir}/usr/share/${pkgname}/sendemail-safe-profile.schema.json"

    install -Dm644 \
        LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
