# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=reactotron-v1
pkgver=1.15.0
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
	"reactotron-v1.png"
	"reactotron-v1.desktop")
sha256sums=('06cb8ce707da5b1d6492be39862889c954f268b6ad5d672ebe0d213d39b7c7da'
	    "d933e27778d417a633975f22b2cdc2b6d8d922bffab916c92fc08062a7621896"
	    "4287b8a022b1c59bdb3ff06dc0e056a6d1ac1779cf1adc33d5b6da61b86cbf9e")

package() {
	cd $srcdir
	install -d $pkgdir/{opt/$pkgname,usr/bin}
	cp -a Reactotron/* $pkgdir/opt/$pkgname
	install -Dm644 $srcdir/reactotron-v1.png $pkgdir/usr/share/pixmaps/$pkgname.png
  	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	ln -s /opt/reactotron-v1/Reactotron $pkgdir/usr/bin/$pkgname
}
