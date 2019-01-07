# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=kubernetic
pkgver=2.2.0
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
source=("https://kubernetic.s3.amazonaws.com/Kubernetic-2.2.0.tar.gz"
	"kubernetic.png"
	"kubernetic.desktop")
sha256sums=('234ba5e659245b51611385d112f5207138e73b78dbbad4f6f0511fb14db5a6bb'
	    "fab7a05be0e7a9d373d0243b810c371eddaf32930f58eece4761b9e4296f8a3f"
	    "61c9a8e4517112cce4efb55ef60f22d92887283cc05879a2cce9cb176f335d31")

package() {
	cd $srcdir
	install -d $pkgdir/{opt/$pkgname,usr/bin}
	cp -a Kubernetic-2.2.0/* $pkgdir/opt/$pkgname
	install -Dm644 $srcdir/kubernetic.png $pkgdir/usr/share/pixmaps/$pkgname.png
  	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	ln -s /opt/kubernetic/kubernetic $pkgdir/usr/bin/$pkgname
}
