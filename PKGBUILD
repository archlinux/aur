# Maintainer: Bailey Kasin <bailey@gingertechnology.net>
pkgname=kernel-uek-devel
pkgver=4.14.35.1844
pkgrel=4
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
source=("https://yum.oracle.com/repo/OracleLinux/OL7/UEKR5/x86_64/getPackage/kernel-uek-devel-4.14.35-1844.0.7.el7uek.x86_64.rpm")
md5sums=('ab762a67fcfbe39b95250183129b4f78')

build() {
	cd "$srcdir"
	rpmextract.sh ../"kernel-uek-devel-4.14.35-1844.0.7.el7uek.x86_64.rpm"
}

package() {
	cd "$srcdir"
	rsync -ruDq $srcdir/usr $pkgdir
}
