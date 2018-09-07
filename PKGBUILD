# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=kubernetic
pkgver=2.0.16
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
source=("https://kubernetic.s3.amazonaws.com/Kubernetic-2.0.16.tar.gz"
	"kubernetic.png"
	"kubernetic.desktop")
sha256sums=('3170847d8766d4d028352f222d7f69af0fc3f76c5b901c2f1f940f640f9e53cd'
	    "fab7a05be0e7a9d373d0243b810c371eddaf32930f58eece4761b9e4296f8a3f"
	    "61c9a8e4517112cce4efb55ef60f22d92887283cc05879a2cce9cb176f335d31")

package() {
	cd $srcdir
	install -d $pkgdir/{opt/$pkgname,usr/bin}
	cp -a Kubernetic-2.0.16/* $pkgdir/opt/$pkgname
	install -Dm644 $srcdir/kubernetic.png $pkgdir/usr/share/pixmaps/$pkgname.png
  	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	ln -s /opt/kubernetic/kubernetic $pkgdir/usr/bin/$pkgname
}
