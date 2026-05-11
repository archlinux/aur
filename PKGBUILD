# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Dylan Araps <dylan.araps@gmail.com>

pkgname=neofetch-suparious
pkgver=7.6.1
pkgrel=1
pkgdesc="A CLI system information tool written in BASH that supports displaying images. Suparious fork"
arch=(any)
url="https://github.com/suparious/neofetch"
license=(MIT)
depends=(bash)
provides=(neofetch)
conflicts=(neofetch)
backup=(etc/neofetch/config.conf)
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
source=("neofetch-suparious-${pkgver}.tar.gz::https://github.com/suparious/neofetch/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bdb1cce707059657177b2fe7d132a2632e316f4bde413be67d4e8524b2a9cae9')

package() {
  cd "neofetch-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
