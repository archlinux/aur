pkgname=(
    'mailhog-bin'
)
pkgver=v1.0.1
pkgrel=1
pkgdesc="Web and API based SMTP testing"
arch=('x86_64')
license=('MIT')
url='https://github.com/mailhog/MailHog'
makedepends=('systemd')

source_x86_64=("https://github.com/mailhog/MailHog/releases/download/${pkgver}/MailHog_linux_amd64")
md5sums_x86_64=('b5628956d35c9d2df3df30f980365df4')

source=("mailhog.service")
md5sums=('f9e7b474bca2cd57920ddec9909a4634')

package_mailhog-bin() {
    cd ${srcdir}
    install -D -m755 ${srcdir}/MailHog_linux_amd64 ${pkgdir}/usr/local/bin/mailhog
    install -D -m644 ${srcdir}/mailhog.service ${pkgdir}/usr/lib/systemd/system/mailhog.service
}


