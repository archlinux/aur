# Maintainer: Dylan Araps <dyl@tfwno.gf>
pkgname=neofetch
pkgver=1.7
pkgrel=1
pkgdesc="CLI script to show your system's info and display an image using w3m."
arch=('any')
url="https://github.com/dylanaraps/$pkgname"
license=('MIT')
conflicts=(${pkgname}-git)
depends=('bash')
optdepends=(
  'cmus: Current Song'
  'feh: Wallpaper Display'
  'imagemagick: Image cropping / Thumbnail creation'
  'mpc: Current Song'
  'moc: Current Song'
  'nitrogen: Wallpaper Display'
  'scrot: Take a screenshot'
  'w3m: Display Images'
  'xorg-xdpyinfo: Resolution detection (Single Monitor)'
  'xorg-xrandr: Resolution detection (Multi Monitor + Refresh rates)'
  'xorg-xprop: Desktop Environment and Window Manager'
)
source=("https://github.com/dylanaraps/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('3e9fd67a9a003df202e3495e0e17ede4')

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
}
