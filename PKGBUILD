# Maintainer: Bailey Kasin <bailey@gingertechnology.net>
pkgname=dtrace-utils-devel
pkgver=1.0.4
pkgrel=2
pkgdesc="DTrace-utils contains the Userspace portion of the DTrace port to Linux"
arch=('x86_64')
url="https://github.com/oracle/dtrace-utils/"
license=('GPL')
makedepends=(
        'rpmextract'
        'rsync'
)

source=("http://yum.oracle.com/repo/OracleLinux/OL7/UEKR5/x86_64/getPackage/dtrace-utils-devel-1.0.4-1.el7.x86_64.rpm")
md5sums=('ef3794036682c0a3882aee8b28cdf065')

build() {
        cd "$srcdir"
        rpmextract.sh ../"dtrace-utils-devel-1.0.4-1.el7.x86_64.rpm"
}

package() {
        cd "$srcdir"
        rsync -ruDq $srcdir/usr $pkgdir
        cd "$pkgdir"
        mv usr/lib64 usr/lib
}
