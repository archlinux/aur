# Maintainer: fa5e4658010be730
pkgname=atomic-upgrade
pkgver=0.0.7
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
sha256sums=('ab5c8701654794defcb1b74c39a2d98d543705568b82166131ddd6e3d5a43999')

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" install
}
