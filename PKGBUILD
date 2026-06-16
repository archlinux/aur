# Maintainer: Pding <pding@oaklight.cn>
pkgname=mtl-power-ctl
pkgver=0.4.0
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
sha256sums=('b7612ab600b793ad3e4d06e85a8daa8b06549fad37a00cd533567048f9fb73c2')
backup=('etc/tlp.d/90-mtl-power-ctl.conf')

package() {
	cd "meteorlake-power-ctl-${pkgver}"
	make install DESTDIR="${pkgdir}"
}
