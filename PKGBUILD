pkgname=kate-syntax-llvm
_svn_rev=239600
pkgver=1.00.r$_svn_rev
pkgrel=1
pkgdesc="LLVM syntax highlighting for Katepart."
arch=('any')
url="http://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
depends=('katepart4')
source=("llvm.xml::https://llvm.org/svn/llvm-project/llvm/trunk/utils/kate/llvm.xml?p=$_svn_rev"
	"LICENSE.TXT::https://llvm.org/svn/llvm-project/llvm/trunk/LICENSE.TXT?p=$_svn_rev")
sha256sums=('9ceb9a61a8c35a5bad144804a63eed5caff397c5f730299b3ea4c4b2d94fc856'
	    '721cb11de618fcf9bbb7d25a389207bf2227357e6694bc326ab32a6699f9b951')

package() {
	install -d "$pkgdir/usr/share/apps/katepart/syntax"
	install -m644 "$srcdir/llvm.xml" "$pkgdir/usr/share/apps/katepart/syntax/"
	
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 "$srcdir/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
