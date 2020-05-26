# Maintainer: Syaoran Code <syaorancode@gmail.com>

pkgname=srfetch
pkgver=7.0.0
pkgrel=6
pkgdesc="This is modified neofetch script, only for me."
arch=('any')
url="https://gitlab.com/justanoobcoder/srfetch.git"
license=('MIT')
depends=('bash')
makedepends=('make')
backup=('etc/srfetch/config.conf')
optdepends=(
  'catimg: Display Images'
  'chafa: Image to text support'
  'feh: Wallpaper Display'
  'imagemagick: Image cropping / Thumbnail creation / Take a screenshot'
  'jp2a: Display Images'
  'libcaca: Display Images'
  'nitrogen: Wallpaper Display'
  'pacman-contrib: Display package count'
  'w3m: Display Images'
  'xdotool: See https://github.com/dylanaraps/neofetch/wiki/Images-in-the-terminal'
  'xorg-xdpyinfo: Resolution detection (Single Monitor)'
  'xorg-xprop: Desktop Environment and Window Manager'
  'xorg-xrandr: Resolution detection (Multi Monitor + Refresh rates)'
  'xorg-xwininfo: See https://github.com/dylanaraps/neofetch/wiki/Images-in-the-terminal'
)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "%s" "$pkgver"
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
