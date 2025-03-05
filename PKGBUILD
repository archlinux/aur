# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=windfetch
pkgver=0.2.1
pkgrel=5
pkgdesc="OS information tool. Fork of Neofetch"
arch=("any")
url="https://codeberg.org/chardon_cs/windfetch"
license=('MIT')
groups=()
backup=('etc/windfetch/config.conf')
depends=(
	"bash"
)
makedepends=(
	"make"
)
checkdepends=()
optdepends=(
  'catimg: Display Images'
  'chafa: Image to text support'
  'feh: Wallpaper Display'
  'imagemagick: Image cropping / Thumbnail creation / Take a screenshot'
  'jp2a: Display Images'
  'libcaca: Display Images'
  'nitrogen: Wallpaper Display'
  'w3m: Display Images'
  'xdotool: See https://github.com/dylanaraps/neofetch/wiki/Images-in-the-terminal'
  'xorg-xdpyinfo: Resolution detection (Single Monitor)'
  'xorg-xprop: Desktop Environment and Window Manager'
  'xorg-xrandr: Resolution detection (Multi Monitor + Refresh rates)'
  'xorg-xwininfo: See https://github.com/dylanaraps/neofetch/wiki/Images-in-the-terminal'
)
provides=()
conflicts=()
replaces=()
options=()
install=
changelog=
source=(
    https://codeberg.org/chardoncs/${pkgname}/archive/v${pkgver}.tar.gz
)
noextract=()
sha256sums=(
	"15acdca3e122df57bf0a0a86f2f9ba53878aaf16714ddc1bbbab5d750457078d"
)
validpgpkeys=(
	"69713F2236BBD93D3E78EFEF0D56181B48414DE8" # Charles Dong
)

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
