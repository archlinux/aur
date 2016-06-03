pkgname=(
    'mailhog-bin'
)
pkgver=v0.2.0
pkgrel=1
arch=('x86_64')
license=('MIT')
url='https://github.com/mailhog/MailHog'
makedepends=('systemd')
source=(
    "https://github.com/mailhog/MailHog/releases/download/${pkgver}/MailHog_linux_amd64"
    "mailhog.service"
)

prepare() {
    cd /tmp
}

build() {
    echo 'build'
}

package_mailhog-bin() {
    cd ${srcdir}
    install -D -m755 ${srcdir}/MailHog_linux_amd64 ${pkgdir}/usr/local/bin/mailhog
    install -D -m644 ${srcdir}/mailhog.service ${pkgdir}/usr/lib/systemd/system/mailhog.service
}

md5sums=(
    '3e6f167e5c398d0220dd001f0aad7a85' # mailhog
    'fbe281034608abdbf8ce5c9527bbf6a8' # mailhog.service
)
