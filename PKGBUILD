# Maintainer: Hayate Nakamura <is01.njb at gmail dot com>
pkgname=unifetch
pkgver=1.0.2
pkgrel=2
pkgdesc="An unofficial fork of neofetch."
arch=('any')
url="https://osdn.net/projects/univalentgnulinux/"
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
source=("${url}/downloads/77899/${pkgname}-${pkgver}.tar.gz")
sha512sums=('496266548792658a08d9b3036636f2df4d42f6bf2e0845ec1fa615719ee69aab94e2a5aea3f8d644dc3953bfae2bc32b03c98297888215cf203295768be56f11')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
