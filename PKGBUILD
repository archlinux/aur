# Maintainer: Hayate Nakamura <is01.njb at gmail dot com>
pkgname=unifetch
pkgver=1.1.1
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
sha512sums=('5a756476686c5a1521e438ffd5ab4e6c272451bb059515ef58b2ff817e60b2cc7afd74ec11a4303941a06cd90bebf6d7ea8e2df307f7e5ffd51f0ad82dde180c')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
