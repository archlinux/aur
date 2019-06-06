# Maintainer: Bailey Kasin <bailey@gingertechnology.net>
pkgname=kernel-uek-devel
pkgver=4.14.35.1902
pkgrel=5
pkgdesc="Oracle's Unbreakable Enterprise Kernel development headers"
arch=('x86_64')
url="https://github.com/oracle/linux-uek"
license=('GPL')
makedepends=(
	'rpmextract'
	'rsync'
)
provides=(
	'linux-headers'
)
source=("http://yum.oracle.com/repo/OracleLinux/OL7/UEKR5/x86_64/getPackage/kernel-uek-devel-4.14.35-1902.0.18.el7uek.x86_64.rpm")
md5sums=('4c289458cef3d1039a4999938cf8777e')

build() {
	cd "$srcdir"
	rpmextract.sh ../"kernel-uek-devel-4.14.35-1902.0.18.el7uek.x86_64.rpm"
}

package() {
	cd "$srcdir"
	rsync -ruDq $srcdir/usr $pkgdir
}
