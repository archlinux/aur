pkgname=(
    'mailhog-bin'
)
pkgver=v0.2.1
pkgrel=3
pkgdesc="Web and API based SMTP testing"
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/mailhog/MailHog'
makedepends=('systemd')

source_i686=("https://github.com/mailhog/MailHog/releases/download/${pkgver}/MailHog_linux_386")
md5sums_i686=('e1b738e87318f3fd72bd58994090e308')

source_x86_64=("https://github.com/mailhog/MailHog/releases/download/${pkgver}/MailHog_linux_amd64")
md5sums_x86_64=('3e6f167e5c398d0220dd001f0aad7a85')

source=("mailhog.service")
md5sums=('9392d6c6fe29668d100fc3bb38bd93dd')

package_mailhog-bin() {
    cd ${srcdir}
    install -D -m755 ${srcdir}/MailHog_linux_amd64 ${pkgdir}/usr/local/bin/mailhog
    install -D -m644 ${srcdir}/mailhog.service ${pkgdir}/usr/lib/systemd/system/mailhog.service
}


