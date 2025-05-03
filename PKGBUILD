# Maintainer : Greg Aluise <galuise@gmail.com>
# Contributer: Yamada Hayao <hayao@fascode.net>
# Contributer: David Mazieres (http://www.scs.stanford.edu/~dm/addr/)

_pkgname="droidcam-obs-plugin"
pkgname="${_pkgname}-bin"
pkgver="2.3.4"
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
sha256sums=('dd16cfefb35740d31e4881cdf6b1974c911f5149c3f1c61b4f0dc3942fda717c')
options=(!debug)

package() {
	mkdir -p "$pkgdir/usr/lib/obs-plugins"
	cp "$srcdir/$pkgstem/bin/64bit/droidcam-obs.so" \
	   "$pkgdir/usr/lib/obs-plugins/"
	mkdir -p "$pkgdir/usr/share/obs/obs-plugins/droidcam-obs"
	cp -r "$srcdir/$pkgstem/data/." \
	   "$pkgdir/usr/share/obs/obs-plugins/droidcam-obs/"
}
