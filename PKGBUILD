# Maintainer: fa5e4658010be730
pkgname=atomic-upgrade
pkgver=0.1.3
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
    'verify-lib'
)
optdepends=(
    'cryptsetup: LUKS support'
    'lvm2: LVM support'
    'bash-completion: bash tab completions'
)
backup=('etc/atomic.conf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('33f037df05ce4c96d73b606adb0e631197b35d5f8b2ddfba7cb2ff949b8db250')

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" install
}
