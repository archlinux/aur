# Maintainer: Erin Heimer <heimer16 at protonmail dot com>
pkgname='mailpit-bin'
pkgver=1.28.4
pkgrel=1
pkgdesc="Web and API based SMTP testing"
arch=('x86_64')
license=('MIT')
url='https://github.com/axllent/mailpit'
optdepends=('systemd')
conflicts=('mailpit')

source=(
        "https://github.com/axllent/mailpit/releases/download/v${pkgver}/mailpit-linux-amd64.tar.gz"
        "mailpit.service"
       )

sha256sums=('8f1c37566e8b59a3f2de9ed9a31c0cdea559d05ae36fb08b7f0ea24a660e74b2'
            '602494cc3d28d58fa430ec3c53fd66e694db9faa87e98e45effe00a844affc4b')

package() {
    install -D -m755 ${srcdir}/mailpit ${pkgdir}/usr/bin/mailpit
    install -D -m644 mailpit.service ${pkgdir}/usr/lib/systemd/system/mailpit.service
}

