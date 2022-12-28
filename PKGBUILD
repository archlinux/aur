# Maintainer: Hayate Nakamura <is01.njb at gmail dot com>
pkgname=unifetch
pkgver=1.2
pkgrel=1
pkgdesc="An unofficial inheritor of neofetch."
arch=('any')
url="https://github.com/Jin-Asanami/unifetch"
license=('MIT')
depends=('bash')
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
checkdepends=('shellcheck')
provides=('neofetch')
conflicts=("${pkgname}")
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('b03ec2b88a81472f9c84bfc030aa84dc3e7ca0572f3094c2fba41cfe9be2de4377899b7a377e8671383d56a705ca0b4a9d0ef924eff4a80c1ca9989f6baa0de4')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
