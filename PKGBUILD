# Maintainer: Dmitriy Smirnov <spilver@igus.lv>
pkgname=guark
_gitname=guark

pkgver=0.0.2
pkgrel=2

pkgdesc="Tray audio player. Written on C with GTK and powered by GStreamer"
arch=('any')
license=("GPL")
url="https://github.com/DimaSmirnov/guark"
depends=('gstreamer0.10', 'gstreamer0.10-plugins', 'libnotify')
source=('git://github.com/DimaSmirnov/guark.git')
md5sums=('SKIP')

build() {
  cd $_gitname
  make
}

package() {
  cd $_gitname
  install -Dm755 $_gitname "$pkgdir/usr/bin/$_gitname"
  install -d "$pkgdir/usr/share/pixmaps/$_gitname/"
  cd "$srcdir/$_gitname/icons"
  install -Dm644 * "$pkgdir/usr/share/pixmaps/$_gitname/"
}
