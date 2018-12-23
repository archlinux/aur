pkgname=kate5-syntax-llvm
_svn_rev=350019
pkgver=1.00.r$_svn_rev
pkgrel=1
pkgdesc="LLVM syntax highlighting for Katepart 5."
arch=('any')
url="http://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
depends=('ktexteditor')
source=(
    "llvm.xml::https://llvm.org/svn/llvm-project/llvm/trunk/utils/kate/llvm.xml?p=$_svn_rev"
    "llvm-tablegen.xml::https://llvm.org/svn/llvm-project/llvm/trunk/utils/kate/llvm-tablegen.xml?p=$_svn_rev"
    "LICENSE.TXT::https://llvm.org/svn/llvm-project/llvm/trunk/LICENSE.TXT?p=$_svn_rev"
)
sha256sums=(
    '944a84fba1b2c76799b1f4295614249d71f3c3a0625a5d1b1019e51a6df8ff09'
    '667c81853cbe652e5aa41798b72b2e328ae141654a6cc3ac0cf773e9016d732c'
    '0303dfeaac87b80d2d1e543aa38d5be77b0eac93c3d04fe7e3c8eaa71a778667'
)

package() {
    install -d "$pkgdir/usr/share/katepart5/syntax"
    install -m644 "$srcdir/llvm.xml" "$pkgdir/usr/share/katepart5/syntax/"
    install -m644 "$srcdir/llvm-tablegen.xml" "$pkgdir/usr/share/katepart5/syntax/"

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 "$srcdir/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
