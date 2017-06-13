# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=reactotron
pkgver=1.11.2
pkgrel=1
pkgdesc="Package archlinux for Reactotron"
arch=('x86_64')
url="https://github.com/infinitered/reactotron"
license=('GPL')
groups=()
depends=()
makedepends=("unzip")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/infinitered/reactotron/releases/download/v$pkgver/Reactotron-linux-x64.zip"
	"reactotron.png"
	"reactotron.desktop")
sha256sums=('40437732b62a80dd114c7ef2d8bae16e24d54700f424866f6abb20968f6e2478'
	    "d933e27778d417a633975f22b2cdc2b6d8d922bffab916c92fc08062a7621896"
	    "90a4434cfd00204fd6e1122caea254658c6f603289f15256a02955bfd7bec9ed")

package() {
	cd $srcdir
	install -d $pkgdir/{opt/$pkgname,usr/bin}
	cp -a Reactotron/* $pkgdir/opt/$pkgname
	install -Dm644 $srcdir/reactotron.png $pkgdir/usr/share/pixmaps/$pkgname.png
  	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	ln -s /opt/reactotron/Reactotron $pkgdir/usr/bin/$pkgname
}
