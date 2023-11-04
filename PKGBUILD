# Maintainer: Erin Heimer <heimer16 at protonmail dot com>
pkgname='mailpit-bin'
pkgver=1.9.10
pkgrel=2
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

sha256sums=(
        '820f60500e083169db4e319efc2223b8d684aec1b100cc1dc7d1f756a9bf6699'
        '602494cc3d28d58fa430ec3c53fd66e694db9faa87e98e45effe00a844affc4b'
        )

package() {
    install -D -m755 ${srcdir}/MailHog_linux_amd64 ${pkgdir}/usr/local/bin/maipit
    install -D -m644 mailpit.service ${pkgdir}/usr/lib/systemd/system/mailpit.service
}


