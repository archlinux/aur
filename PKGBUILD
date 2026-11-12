# Maintainer:  Markus Hansmair <archlinux at zendro dot de>

pkgname=mkinitcpio-systemd-extras
pkgver=0.10.4
pkgrel=1
pkgdesc="Collection of mkinitcpio install hooks for systemd based initramfs"
arch=('any')
url="https://github.com/wolegis/mkinitcpio-systemd-extras"
license=('GPL')
depends=('mkinitcpio')
makedepends=()
optdepends=('tinyssh: for sd-tinyssh'
            'python: for sd-tinyssh (converting OpenSSH host keys to tinyssh format)'
            'dropbear: for sd-dropbear'
            'openssh: for sd-openssh'
            'clevis: for sd-clevis (unlocking luks encrypted volumes with clevis)'
            'tpm2-tools: for sd-clevis (unlocking with TPM2)'
            'curl: for sd-clevis (unlocking with tang)'
            'nftables: for sd-nftables')
conflicts=('mkinitcpio-netconf' 'mkinitcpio-tinyssh' 'mkinitcpio-dropbear')
source=("https://github.com/wolegis/mkinitcpio-systemd-extras/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3154df8ad481f0744d5fab1b4d4e8eeeb7440f2353c5e50ddcc5d491b27f6b96')

package() {
    mkdir -p "${pkgdir}/usr/lib/initcpio/"{install,functions.d}
    cp "${srcdir}/${pkgname}-${pkgver}/sd-"* "${pkgdir}/usr/lib/initcpio/install"
    cp "${srcdir}/${pkgname}-${pkgver}/functions" "${pkgdir}/usr/lib/initcpio/functions.d/systemd-extras"
}
