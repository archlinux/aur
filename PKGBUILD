pkgname=(
    'mailhog-bin'
)
pkgver=v1.0.0
pkgrel=1
pkgdesc="Web and API based SMTP testing"
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/mailhog/MailHog'
makedepends=('systemd')

source_i686=("https://github.com/mailhog/MailHog/releases/download/${pkgver}/MailHog_linux_386")
md5sums_i686=('29835831295ca15e1e6566b3c65090d8')

source_x86_64=("https://github.com/mailhog/MailHog/releases/download/${pkgver}/MailHog_linux_amd64")
md5sums_x86_64=('3b758c81bfe2c9110911511daca1a7bc')

source=("mailhog.service")
md5sums=('fbe281034608abdbf8ce5c9527bbf6a8')

package_mailhog-bin() {
    cd ${srcdir}
    install -D -m755 ${srcdir}/MailHog_linux_amd64 ${pkgdir}/usr/local/bin/mailhog
    install -D -m644 ${srcdir}/mailhog.service ${pkgdir}/usr/lib/systemd/system/mailhog.service
}


