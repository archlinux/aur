# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Dylan Araps <dylan.araps@gmail.com>

pkgname=neofetch
pkgver=3.4.0
pkgrel=2
pkgdesc="A CLI system information tool written in BASH that supports displaying images."
arch=('any')
url="https://github.com/dylanaraps/neofetch"
license=('MIT')
depends=('bash')
backup=('etc/neofetch/config.conf')
optdepends=(
  'feh: Wallpaper Display'
  'imagemagick: Image cropping / Thumbnail creation / Take a screenshot'
  'nitrogen: Wallpaper Display'
  'w3m: Display Images'
  'catimg: Display Images'
  'jp2a: Display Images'
  'libcaca: Display Images'
  'xdotool: See https://github.com/dylanaraps/neofetch/wiki/Images-in-the-terminal'
  'xorg-xdpyinfo: Resolution detection (Single Monitor)'
  'xorg-xprop: Desktop Environment and Window Manager'
  'xorg-xrandr: Resolution detection (Multi Monitor + Refresh rates)'
  'xorg-xwininfo: See https://github.com/dylanaraps/neofetch/wiki/Images-in-the-terminal'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dylanaraps/neofetch/archive/${pkgver}.tar.gz")
sha256sums=('2b03328e92f80de8aca9571ad693f4e8b86b62e9c99792f3002f82907c5530a3')

package() {
  cd "${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
