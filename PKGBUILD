# Maintainer : Greg Aluise <galuise@gmail.com>
# Contributer: Yamada Hayao <hayao@fascode.net>
# Contributer: David Mazieres (http://www.scs.stanford.edu/~dm/addr/)

_pkgname="droidcam-obs-plugin"
pkgname="${_pkgname}-bin"
pkgver="2.4.0"
pkgrel="1"
pkgdesc="Plugin for DroidCam OBS"
arch=("x86_64" "i686")
url="https://droidcam.app/"
license=('GPL')
depends=("obs-studio")
makedepends=()
conflicts=("${_pkgname}-git" "${_pkgname}")
provides=("${_pkgname}")
pkgstem="${_pkgname%-plugin}"
source=("https://github.com/dev47apps/droidcam-obs-plugin/releases/download/${pkgver}/droidcam_obs_${pkgver}_linux_flatpak.zip")
sha256sums=('2f5ad8eded1b3d46bf23300591b2dab13264a9f71a1836efe0d3fdae56ef57c7')
options=(!debug)

package() {
	mkdir -p "$pkgdir/usr/lib/obs-plugins"
	cp "$srcdir/$pkgstem/bin/64bit/droidcam-obs.so" \
	   "$pkgdir/usr/lib/obs-plugins/"
	mkdir -p "$pkgdir/usr/share/obs/obs-plugins/droidcam-obs"
	cp -r "$srcdir/$pkgstem/data/." \
	   "$pkgdir/usr/share/obs/obs-plugins/droidcam-obs/"
}
