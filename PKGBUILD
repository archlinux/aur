# Maintainer: Pding <pding@oaklight.cn>
pkgname=mtl-power-ctl
pkgver=0.4.2
pkgrel=1
pkgdesc="Power profile manager for Intel Meteor Lake laptops (TLP + LPMD + SMT + P-core parking)"
arch=('any')
url="https://github.com/oaklight/meteorlake-power-ctl"
license=('MIT')
depends=('python>=3.10' 'tlp' 'libnotify' 'upower')
optdepends=(
	'intel-lpmd: Low Power Mode Daemon for LP E-core scheduling'
	'niri: display refresh rate switching via IPC'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5c18a34ee3317dd7d152f8002ce8a0f8c156981c2ced24b351f1a7a0eba8e991')
backup=('etc/tlp.d/90-mtl-power-ctl.conf')

package() {
	cd "meteorlake-power-ctl-${pkgver}"
	make install DESTDIR="${pkgdir}"
}
