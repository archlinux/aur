# Maintainer:  Markus Hansmair <archlinux at zendro dot de>

pkgname=mkinitcpio-systemd-extras
pkgver=0.7.2
pkgrel=1
pkgdesc="Collection of mkinitcpio install hooks for systemd based initramfs"
arch=('any')
url="https://github.com/wolegis/mkinitcpio-systemd-extras"
license=('GPL')
depends=('mkinitcpio')
makedepends=('git')
optdepends=('tinyssh: for sd-tinyssh'
            'python: for sd-tinyssh (converting OpenSSH host keys to tinyssh format)'
            'dropbear: for sd-dropbear'
            'clevis: for sd-clevis (unlocking luks encrypted volumes with clevis)'
            'tpm2-tools: for sd-clevis (unlocking with TPM2)'
            'curl: for sd-clevis (unlocking with tang)'
            'nftables: for sd-nftables')
conflicts=('mkinitcpio-netconf' 'mkinitcpio-tinyssh' 'mkinitcpio-dropbear')
source=("repo::git+https://github.com/wolegis/mkinitcpio-systemd-extras.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    local hookdir="${pkgdir}/usr/lib/initcpio/install"
    mkdir -p "${hookdir}"
    cp "${srcdir}/repo/sd-"* "${hookdir}"
}
