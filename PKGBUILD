# Maintainer: fa5e4658010be730
pkgname=atomic-upgrade
pkgver=0.0.13
pkgrel=1
pkgdesc="Atomic system upgrades for Arch Linux (Btrfs + UKI + Secure Boot)"
arch=('any')
url="https://gitlab.com/fkzys/atomic-upgrade"
license=('AGPL-3.0-or-later')
depends=(
    'btrfs-progs'
    'systemd-ukify'
    'sbctl'
    'python'
    'arch-install-scripts'
)
optdepends=(
    'cryptsetup: LUKS support'
    'lvm2: LVM support'
)
backup=('etc/atomic.conf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('f8b17aa9b83275ec2733cc051eff3c2bb2a7ec8b2bfdcf4fe1855a69ee86d94c')

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" install
}
