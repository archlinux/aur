# Maintainer: fa5e4658010be730
pkgname=atomic-upgrade
pkgver=0.0.4
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
sha256sums=('31c33c217472b4c299bf623c2ef56b8177ed8822757e1b8784d2bd9587fb4c41')

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" install
}
