# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Dylan Araps <dylan.araps@gmail.com>

pkgname=neofetch
pkgver=7.1.0
pkgrel=1
pkgdesc="A CLI system information tool written in BASH that supports displaying images."
arch=('any')
url="https://github.com/dylanaraps/neofetch"
license=('MIT')
depends=('bash')
backup=('etc/neofetch/config.conf')
optdepends=(
  'catimg: Display Images'
  'chafa: Image to text support'
  'feh: Wallpaper Display'
  'imagemagick: Image cropping / Thumbnail creation / Take a screenshot'
  'jp2a: Display Images'
  'libcaca: Display Images'
  'nitrogen: Wallpaper Display'
  'pacman-contrib: Display package count'
  'w3m: Display Images'
  'xdotool: See https://github.com/dylanaraps/neofetch/wiki/Images-in-the-terminal'
  'xorg-xdpyinfo: Resolution detection (Single Monitor)'
  'xorg-xprop: Desktop Environment and Window Manager'
  'xorg-xrandr: Resolution detection (Multi Monitor + Refresh rates)'
  'xorg-xwininfo: See https://github.com/dylanaraps/neofetch/wiki/Images-in-the-terminal'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dylanaraps/neofetch/archive/${pkgver}.tar.gz")
sha256sums=('58a95e6b714e41efc804eca389a223309169b2def35e57fa934482a6b47c27e7')

package() {
  cd "${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
