# Maintainer: 6543 <6543@obermui.de>
# Contributor: artoo <artoo@artixlinux.org>
# Contributor: Oscar Campos <damnwidget@artixlinux.org>

pkgname=autofs-openrc
pkgver=20210506
pkgrel=2
pkgdesc="OpenRC autofs init script"
arch=('any')
url="https://code.obermui.de/6543/autofs-openrc"
license=('GPL2')
provides=('init-autofs')
depends=('openrc' 'autofs')
conflicts=('init-autofs')
source=("autofs.confd"
        "autofs.initd")
sha256sums=('d95fc4b88c02dafcd771e35f7422f4f03642687187a17613d3f2b0fb48caaad4'
            '517faf155ff348df8df4437d6c5352538f0b686d22b646d816b9efe91e4eebd2')

package() {
    install -Dm755 "${srcdir}/autofs.initd" "${pkgdir}/etc/init.d/autofs"
    install -Dm644 "${srcdir}/autofs.confd" "${pkgdir}/etc/conf.d/autofs"
}
