# Maintainer: Federico Antoniazzi <federico.antoniazzi.000@gmail.com>

pkgname=neofetch-btw
pkgver=7.1.0
pkgrel=2
pkgdesc="Fork of neofetch but tuned for archlinux btw"
arch=('any')
url="https://github.com/federicoantoniazzi/neofetch-btw"
license=('MIT')
depends=('bash')
conflicts=('neofetch')
makedepends=('git')
backup=('etc/neofetch/config.conf')
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
_commit="6b85c9164df928606ba2ce4c42c0eaa77a9d8b48"
source=("git+${url}.git#commit=${_commit}?signed")
validpgpkeys=("C55C90BF1849EB51631EC49A08F51F421DC997C6")
sha256sums=('SKIP')

package() {
  cd "${pkgname}"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
