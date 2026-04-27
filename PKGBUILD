# Maintainer: fkzys <fkzys at proton dot me>
pkgname=atomic-upgrade
pkgver=0.1.9
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
sha256sums=('722db85f003fd945e1d4177d27e29e28399e49d2becee86435b9fe33db3a1e77')

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" install
}
