# Maintainer: trya <tryagainprod@gmail.com>
# Contributor: KillaB <xGenoBlast@gmail.com>

pkgname=regen
pkgver=0.95
pkgrel=7
pkgdesc="An accuracy focused emulator for Sega Genesis/Mega Drive"
arch=("i686" "x86_64")
url="http://aamirm.hacking-cult.org/index_files/regen.htm"
license=('custom')
depends=('gtk2' 'sdl' 'libpng12' 'alsa-lib' 'libxv' 'libgl' 'libffi5')
depends_x86_64=('lib32-gtk2' 'lib32-sdl' 'lib32-libpng12' 'lib32-alsa-lib' 'lib32-libxv' 'lib32-libgl' 'lib32-libffi5')
makedepends=('upx')
source=("http://aamirm.hacking-cult.org/regen/regen-gtk-$pkgver.tar.bz2"
	'regen.desktop' 'regen_icon.png' 'LICENSE')
md5sums=('ec38384f3beaceaf72797c239aa4834e'
         'bf8495d681e12d3d8520c8338ad6c1f6'
	 'd88da0445234b85cc7521cc0313e57b3'
         '12438e857789f43c6645e53ab0e395a1')
options=(!strip)

package() {
  cd "$srcdir"
  upx -d regen
  install -Dm755 regen "$pkgdir/usr/bin/regen"
  install -Dm644 regen.desktop "$pkgdir/usr/share/applications/regen.desktop"
  install -Dm644 regen_icon.png "$pkgdir/usr/share/pixmaps/regen_icon.png"
  install -Dm644 README "$pkgdir/usr/share/doc/regen/README"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/regen/LICENSE"
}
