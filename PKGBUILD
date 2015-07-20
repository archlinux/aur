# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=hammerdb
pkgver=2.17
pkgrel=1
pkgdesc="A database testing tool"
arch=('i686' 'x86_64')
url="http://hammerdb.com"
license=('GPLv2')
source_x86_64=("http://downloads.sourceforge.net/project/hammerora/HammerDB/HammerDB-2.17/HammerDB-2.17-Linux-x86-64-Install")
source_i686=("http://downloads.sourceforge.net/project/hammerora/HammerDB/HammerDB-2.17/HammerDB-2.17-Linux-x86-Install")
source=("run.sh" "hammerdb")
md5sums=('e6a1349accdd70b661f25f06a82023aa'
         '17489353e99ad15858cdc2bcbbf839c5')
md5sums_i686=('e2692b2e02147c22956977e70ba6cdb4')
md5sums_x86_64=('54695997e1f45ae4a9ebeea02fdfc1d4')

package() {
    mkdir -p "$pkgdir/opt/hammerdb/"
    mkdir -p "$pkgdir/usr/bin"
    cd "$srcdir" && chmod 755 run.sh
    ./run.sh "$CARCH" "$pkgdir/opt/hammerdb/"
    install -m 0755 hammerdb "$pkgdir/usr/bin/"
    chmod 755 "$pkgdir/opt/hammerdb/hammerdb.tcl"
}