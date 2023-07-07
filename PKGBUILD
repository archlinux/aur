# Maintainer:  Markus Hansmair <archlinux at zendro dot de>

pkgname=mkinitcpio-systemd-extras
pkgver=0.5
pkgrel=1
pkgdesc="Collection of mkinitcpio install hooks for systemd based initramfs"
arch=('any')
url="https://github.com/wolegis/mkinitcpio-systemd-extras"
license=('GPL')
depends=('mkinitcpio')
optdepends=('tinyssh: for sd-tinyssh'
            'python: for converting OpenSSH host keys to tinyssh format'
            'dropbear: for sd-dropbear')
conflicts=('mkinitcpio-netconf' 'mkinitcpio-tinyssh' 'mkinitcpio-dropbear')
source=("repo::git+https://github.com/wolegis/mkinitcpio-systemd-extras.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    local hookdir="${pkgdir}/usr/lib/initcpio/install"
    mkdir -p "${hookdir}"
    cp "${srcdir}/repo/sd-"* "${hookdir}"
}
