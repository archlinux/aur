# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=kubernetic
pkgver=2.5.0
pkgrel=1
pkgdesc="Package archlinux for Kubernetic"
arch=('x86_64')
url="https://kubernetic.com/"
license=('GPL')
groups=()
depends=()
makedepends=("tar")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://kubernetic.s3.amazonaws.com/Kubernetic-2.5.0.tar.gz"
	"kubernetic.png"
	"kubernetic.desktop")
sha256sums=('f7d2881a0ca8a032da3216bcd56faf7ba12d6d9586429464d1b36de81353eaab'
	    "fab7a05be0e7a9d373d0243b810c371eddaf32930f58eece4761b9e4296f8a3f"
	    "5e0619724b45e9fca5d665b56066459bd072899802de22508da51ce58e21c820")

package() {
	cd $srcdir
	install -d $pkgdir/{opt/$pkgname,usr/bin}
	cp -a Kubernetic-2.5.0/* $pkgdir/opt/$pkgname
	install -Dm644 $srcdir/kubernetic.png $pkgdir/usr/share/pixmaps/$pkgname.png
  	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	ln -s /opt/kubernetic/kubernetic $pkgdir/usr/bin/$pkgname
}
