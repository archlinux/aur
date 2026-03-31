# Maintainer: fa5e4658010be730
pkgname=atomic-upgrade
pkgver=0.1.7
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
    'verify-lib'
)
optdepends=(
    'cryptsetup: LUKS support'
    'lvm2: LVM support'
    'bash-completion: bash tab completions'
)
backup=('etc/atomic.conf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('2b0b668d6c504cac8ca11cc9e4cad004d8e87da04c0756ee815a5095f8229c56')

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" install
}
