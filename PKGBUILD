# Maintainer: Estela ad Astra <i@estela.cn>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Dylan Araps <dylan.araps@gmail.com>

pkgname=hyfetch-neofetch
_pkgname=hyfetch
pkgver=1.4.8
pkgrel=1
pkgdesc="Descendent of Neofetch - a CLI system information tool written in BASH that supports displaying images."
arch=('any')
url="https://github.com/hykilpikonna/hyfetch"
license=('MIT')
depends=('bash')
backup=('etc/neofetch/config.conf')
provides=("neofetch")
conflicts=("neofetch")
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
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/hykilpikonna/hyfetch/archive/${pkgver}.tar.gz")
sha256sums=('d2753230cd2ce1591a14757cbd816cf4823911042534f8bbccd4ae80a1e81f91')

package() {
  cd "${_pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
