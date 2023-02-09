# Maintainer: flafflar
# Contributor: nic96
pkgname=worldeditor-bin
pkgver=2.5.0r3
pkgrel=1
pkgdesc="WorldEditor (WED) is a CAD-like graphic editor that lets you create custom airport layouts. It is designed for X-Plane, and works with apt.dat version 850 and higher."
url="http://developer.x-plane.com/tools/worldeditor/"
license=('GPL')
depends=('fltk' 'glu' 'ttf-font')
install='worldeditor.install'
arch=('i686' 'x86_64')
source=("http://dev.x-plane.com/download/tools/wed_lin_${pkgver//\./}.zip"
        "WorldEditor.desktop"
        "WorldEditor.png")
md5sums=('91236b3ebffa3b7c44aed9ed4c32870c'
         'b25f4e3cc6a845a457329de93c04c929'
         '0efb061145dcfec118afcc6ffff044f1')

package() {
  cd "${srcdir}/"
  install -Dm755 "$srcdir"/WED "$pkgdir"/usr/bin/WED
  install -Dm644 "$srcdir"/WorldEditor.desktop "$pkgdir"/usr/share/applications/WorldEditor.desktop
  install -Dm644 "$srcdir"/WorldEditor.png "$pkgdir"/usr/share/pixmaps/WorldEditor.png
}
