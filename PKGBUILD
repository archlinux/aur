# Maintainer: Hayate Nakamura <is01.njb at gmail dot com>
pkgname=unifetch-git
_pkgname=unifetch
pkgver=22.12
pkgrel=21
pkgdesc="An unofficial inheritor of neofetch, fresh version."
arch=('any')
url="https://github.com/jin-asanami/"
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
makedepends=('git')
checkdepends=('shellcheck')
conflicts=("unifetch")
source=(${_pkgname}::"git+${url}/${_pkgname}.git")
sha512sums=('SKIP')

package() {
  cd ${_pkgname}
  git checkout master
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
