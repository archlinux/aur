# Maintainer: fkzys <fkzys at proton dot me>
pkgname=atomic-upgrade
pkgver=0.1.9
pkgrel=1
pkgdesc="Atomic system upgrades for Arch Linux (Btrfs + UKI + Secure Boot)"
arch=('any')
url="https://github.com/fkzys/atomic-upgrade"
license=('AGPL-3.0-or-later')
depends=(
    'btrfs-progs'
    'systemd-ukify'
    'sbctl'
    'python'
    'verify-lib'
)
optdepends=(
    'cryptsetup: LUKS support'
    'lvm2: LVM support'
    'bash-completion: bash tab completions'
)
backup=('etc/atomic.conf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9d9dfb95f65d52fecf9bb135196e17d545642269a61564a74272538b29b6bbe6')

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
