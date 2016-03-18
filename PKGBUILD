# Maintainer: Dylan Araps <dyl@tfwno.gf>
pkgname=neofetch
_pkgname=neofetch
pkgver=1.5
pkgrel=1
pkgdesc="CLI script to show your system's info and display an image using w3m."
arch=('any')
url="https://github.com/dylanaraps/$pkgname"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname ${pkgname}-git)
depends=('bash' 'xorg-xprop')
optdepends=(
  'cmus: Current Song'
  'feh: Wallpaper Display'
  'imagemagick: Image cropping / Thumbnail creation'
  'mpc: Current Song'
  'moc: Current Song'
  'nitrogen: Wallpaper Display'
  'scrot: Take a screenshot'
  'w3m: Display Images'
  'xorg-xdpyinfo: Resolution Detection'
)
source=("https://github.com/dylanaraps/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('e49f0d09efce0f129c17886b0611e82b')

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
}
