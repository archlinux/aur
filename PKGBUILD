# Maintainer: Hayate Nakamura <is01.njb at gmail dot com>
pkgname=unifetch
pkgver=1.1.2
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
conflicts=("${pkgname}")
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('2cbdf86ace9d53bf9a67c706c7d40739c5577f64db09ee18bc5728f9c216d4df20610a76bb526d7cca2d0cda5388c4781ba54a6f5c013039253b4847d5795d19')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
