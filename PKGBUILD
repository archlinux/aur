# Maintainer: Marco Righi <marco.righi@cnr.it>

pkgname=sendemail-safe
pkgver=1.0.0
pkgrel=1
pkgdesc="SMTP command-line tools that keep credentials out of process command lines"
arch=('any')
url="https://github.com/marcorighi/sendEmail-safe"
license=('MIT')
depends=('python')

source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=('f48f038e865c83da325b06bbe16041901342ec2c1c4411856971cf7a429da631')

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
        LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
