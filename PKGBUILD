pkgname=(
    'mailhog-bin'
)
pkgver=v0.2.1
pkgrel=4
pkgdesc="Web and API based SMTP testing"
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/mailhog/MailHog'
makedepends=('systemd')

source_i686=("https://github.com/mailhog/MailHog/releases/download/${pkgver}/MailHog_linux_386")
md5sums_i686=('e7c74067f74470c03d2e3ad4f9fda7d9')

source_x86_64=("https://github.com/mailhog/MailHog/releases/download/${pkgver}/MailHog_linux_amd64")
md5sums_x86_64=('6602fd7f69276e7efba310362e958133')

source=("mailhog.service")
md5sums=('fbe281034608abdbf8ce5c9527bbf6a8')

package_mailhog-bin() {
    cd ${srcdir}
    install -D -m755 ${srcdir}/MailHog_linux_amd64 ${pkgdir}/usr/local/bin/mailhog
    install -D -m644 ${srcdir}/mailhog.service ${pkgdir}/usr/lib/systemd/system/mailhog.service
}


