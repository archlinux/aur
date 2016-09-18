pkgname=kate-syntax-llvm
_svn_rev=281851
pkgver=1.00.r$_svn_rev
pkgrel=1
pkgdesc="LLVM syntax highlighting for Katepart."
arch=('any')
url="http://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
depends=('katepart4')
source=(
    "llvm.xml::https://llvm.org/svn/llvm-project/llvm/trunk/utils/kate/llvm.xml?p=$_svn_rev"
    "LICENSE.TXT::https://llvm.org/svn/llvm-project/llvm/trunk/LICENSE.TXT?p=$_svn_rev"
)
sha256sums=(
    '9ceb9a61a8c35a5bad144804a63eed5caff397c5f730299b3ea4c4b2d94fc856'
    '9c9a05118ed1b6d96781a2e52335f7d4ec3dd6e7139340a8aa95fbf7eb4f199a'
)

package() {
    install -d "$pkgdir/usr/share/apps/katepart/syntax"
    install -m644 "$srcdir/llvm.xml" "$pkgdir/usr/share/apps/katepart/syntax/"
    
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 "$srcdir/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
