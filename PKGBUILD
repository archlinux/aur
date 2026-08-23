# Maintainer: Pding <pding@oaklight.cn>
pkgname=mtl-power-ctl
pkgver=0.5.0
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
sha256sums=('0a0b84510ce1857a3d25eeef064406d99bb1f5d2583c819fcdafb291ea75b9f0')
backup=('etc/tlp.d/90-mtl-power-ctl.conf' 'etc/power-ctl.conf')

package() {
	cd "meteorlake-power-ctl-${pkgver}"
	make install DESTDIR="${pkgdir}"
}
