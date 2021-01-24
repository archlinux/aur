# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>

pkgname=bfetch
pkgver=2021.01.24
pkgrel=1
pkgdesc="A CLI system information tool written in BASH that supports displaying images."
arch=('any')
groups=('therepoclub')
url="https://github.com/TheCynicalTeam/$pkgname"
license=('CC BY-NC-SA 4.0')
depends=('bash')
makedepends=('git')
optdepends=(
  'catimg: Display Images'
  'chafa: Image to text support'
  'feh: Wallpaper Display'
  'imagemagick: Image cropping / Thumbnail creation / Take a screenshot'
  'jp2a: Display Images'
  'libcaca: Display Images'
  'nitrogen: Wallpaper Display'
  'w3m: Display Images'
  'xorg-xdpyinfo: Resolution detection (Single Monitor)'
  'xorg-xprop: Desktop Environment and Window Manager'
  'xorg-xrandr: Resolution detection (Multi Monitor + Refresh rates)'
)
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('160374b4fdf7c75c59fe18b06dcaa9861c5f39cd53c80e0b1943cd7fabbc3c83')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
