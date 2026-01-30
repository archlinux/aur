# Maintainer: Grafcube <grafcube at disroot dot org>

pkgname=uki-snapper
pkgver=1.0.0
pkgrel=1
pkgdesc='A simple utility that automatically adds boot entries for snapper snapshots'
arch=(any)
url=https://codeberg.org/grafcube/${pkgname}
license=(GPL-3.0-only)
depends=(bash btrfs-progs snapper util-linux)
optdepends=(
	'mkinitcpio: To generate UKIs'
	'uki-efi-boot: To add entries to the UEFI boot menu'
)
makedepends=()
provides=()
conflicts=()
backup=(etc/uki-snapper.conf)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9d26bfa7e5df819671c28677c45d92a06ea9e6c800e22f004dda61632964d39b')

package() {
	cd "$pkgname"
	make \
		INSTALL_ROOT=$pkgdir \
		BINARY_PATH=/usr/bin \
		SERVICE_PATH=/usr/lib/systemd/system \
		install
}
