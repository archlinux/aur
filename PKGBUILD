# Maintainer: Michele Bovo <mbovo@gmx.com>

pkgname=qzdl-git
pkgver=491.68668f1
pkgrel=1
pkgdesc="A ZDoom launcher using Qt - git version"
arch=('x86_64')
url="http://zdl.vectec.net"
license=('GPL')
depends=('qt5-base' 'hicolor-icon-theme')
optdepends=('gzdoom' 'prboom-plus' 'chocolate-doom' 'crispy-doom' 'freedoom')
conflicts=('qzdl')
makedepends=('git' 'cmake')
source=("git+https://github.com/qbasicer/qzdl.git"
"zdl.desktop")
sha256sums=("SKIP"
"ba17717a3dee6043696e349ea56951fa2848d8fc5271b0ce3d4ac8fafdd711a7")

pkgver() {
  cd "$SRCDEST/qzdl"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build()
{
 cd $srcdir/qzdl
 cmake .
 make
}

package()
{
	install -Dm755 $srcdir/qzdl/zdl $pkgdir/usr/bin/zdl
	install -Dm644 $srcdir/qzdl/ico_icon.xpm $pkgdir/usr/share/pixmaps/zdl.xpm
	install -Dm644 $srcdir/qzdl/res/zdl3-32x32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/zdl.png
	install -Dm644 $srcdir/qzdl/res/zdl3-64x64.png $pkgdir/usr/share/icons/hicolor/64x64/apps/zdl.png
	install -Dm644 $srcdir/qzdl/res/zdl3-128x128.png $pkgdir/usr/share/icons/hicolor/128x128/apps/zdl.png
	install -Dm644 $srcdir/qzdl/res/zdl3-256x256.png $pkgdir/usr/share/icons/hicolor/256x256/apps/zdl.png
	install -Dm644 $srcdir/qzdl/res/zdl3-512x512.png $pkgdir/usr/share/icons/hicolor/512x512/apps/zdl.png
	install -Dm644 $srcdir/qzdl/res/zdl3.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/zdl.svg
	install -Dm644 $srcdir/zdl.desktop $pkgdir/usr/share/applications/zdl.desktop
}
