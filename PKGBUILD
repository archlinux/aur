# Maintainer: Hayate Nakamura <is01.njb at gmail dot com>
pkgname=unifetch
pkgver=1.1
pkgrel=1
pkgdesc="Show system info, fork of neofetch."
arch=('any')
url="https://github.com/Jin-Asanami/unifetch"
_url="https://osdn.net/projects/univalentgnulinux"
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
conflicts=("${pkgname}")
source=("${_url}/storage/aur/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('40c459fd40b4e1f2cf6308af829b571fd62176fb8e4c2bf56cdaadcc43d8505b35c80634204d3c5a43876a05beea9afac3d6661ad54210a687bf2c661c297f2d')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
