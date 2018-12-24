# Maintainer: Bailey Kasin <bailey@gingertechnology.net>
pkgname=dtrace-utils-devel
pkgver=1.1.1
pkgrel=3
pkgdesc="DTrace-utils contains the Userspace portion of the DTrace port to Linux"
arch=('x86_64')
url="https://github.com/oracle/dtrace-utils/"
license=('GPL')
makedepends=(
        'rpmextract'
        'rsync'
)

source=("https://yum.oracle.com/repo/OracleLinux/OL7/UEKR5/x86_64/getPackage/dtrace-utils-devel-1.1.1-1.el7.x86_64.rpm")
md5sums=('818616edbf803d697fc096012332d84f')

build() {
        cd "$srcdir"
        rpmextract.sh ../"dtrace-utils-devel-1.1.1-1.el7.x86_64.rpm"
}

package() {
        cd "$srcdir"
        rsync -ruDq $srcdir/usr $pkgdir
        cd "$pkgdir"
        mv usr/lib64 usr/lib
}
