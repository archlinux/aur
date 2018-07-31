# Maintainer: Bailey Kasin <bailey@gingertechnology.net>
pkgname=dtrace-utils-devel
pkgver=1.0.2
pkgrel=1
pkgdesc="DTrace-utils contains the Userspace portion of the DTrace port to Linux"
arch=('x86_64')
url="https://github.com/oracle/dtrace-utils/"
license=('GPL')
makedepends=(
        'rpmextract'
        'rsync'
)

source=("http://yum.oracle.com/repo/OracleLinux/OL7/UEKR5/x86_64/getPackage/dtrace-utils-devel-1.0.2-1.el7.x86_64.rpm")
md5sums=('abaae48c25afec1cb8e4d1958bcba5b2')

build() {
        cd "$srcdir"
        rpmextract.sh ../"dtrace-utils-devel-1.0.2-1.el7.x86_64.rpm"
}

package() {
        cd "$srcdir"
        rsync -ruDq $srcdir/usr $pkgdir
        cd "$pkgdir"
        mv usr/lib64 usr/lib
}
