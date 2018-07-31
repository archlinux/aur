# Maintainer: Bailey Kasin <bailey@gingertechnology.net>
pkgname=kernel-uek-devel
pkgver=4.14.35
pkgrel=1
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
source=("http://yum.oracle.com/repo/OracleLinux/OL7/UEKR5/x86_64/getPackage/kernel-uek-devel-4.14.35-1818.0.9.el7uek.x86_64.rpm")
md5sums=('54a05aa9cfd54caaea594ea41389ce5f')

build() {
	cd "$srcdir"
	rpmextract.sh ../"kernel-uek-devel-4.14.35-1818.0.9.el7uek.x86_64.rpm"
}

package() {
	cd "$srcdir"
	rsync -ruDq $srcdir/usr $pkgdir
}
