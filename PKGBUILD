# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=reactotron
pkgver=2.1.2
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
sha256sums=('9e51df8abcf37d412b439224e441c432214e851bbea2b4a8bc1495c936e90281'
	    "d933e27778d417a633975f22b2cdc2b6d8d922bffab916c92fc08062a7621896"
	    "67142bd7f88c8484713ac13cd552d0018068a817e6b467a6eaa4a2fa0cbed514")

package() {
	cd $srcdir
	install -d $pkgdir/{opt/$pkgname,usr/bin}
	cp -a Reactotron/* $pkgdir/opt/$pkgname
	install -Dm644 $srcdir/reactotron.png $pkgdir/usr/share/pixmaps/$pkgname.png
  	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	ln -s /opt/reactotron/Reactotron $pkgdir/usr/bin/$pkgname
}
