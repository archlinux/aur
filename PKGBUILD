# Maintainer: fa5e4658010be730
pkgname=atomic-upgrade
pkgver=0.0.3
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
sha256sums=('d660986e78b138a470d45eb4d16c64854b5e36cf07e1509b8f8bded99f23dffa')

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" install
}
