# Maintainer: Erin Heimer <heimer16 at protonmail dot com>
pkgname='mailpit-bin'
pkgver=1.29.7
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

sha256sums=('2ca8202f34b0ce35cf2144671ea6a0e43470c4a3621873e107dad440fd39f2b2'
            '602494cc3d28d58fa430ec3c53fd66e694db9faa87e98e45effe00a844affc4b')

package() {
    install -D -m755 ${srcdir}/mailpit ${pkgdir}/usr/bin/mailpit
    install -D -m644 mailpit.service ${pkgdir}/usr/lib/systemd/system/mailpit.service
}

