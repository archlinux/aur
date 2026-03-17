# Maintainer: fa5e4658010be730
pkgname=atomic-upgrade
pkgver=0.0.21
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
sha256sums=('9589b8b409b5b7560f842e12f46b7fe2f672d9697d6112c6151f9f59f28160cd')

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" install
}
