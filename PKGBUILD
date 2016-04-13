pkgname=imaputils
pkgver=20160413
pkgrel=1
pkgdesc="perl script for managing/searching mail on an IMAP servers from the command line"
arch=(any)
url="https://sourceforge.net/projects/imaputils/files/"
license=('BSD')
depends=('perl-mail-imapclient' 'perl-datetime-format-mail' 'perl-datetime')
source=("$pkgname::git://git.code.sf.net/p/imaputils/git"
	"timeout.patch::http://pastie.org/pastes/10795427/download")
md5sums=('SKIP'
         '88bc6befed0cd1476ffeb84eb2d00aea')

prepare() {
	cd "$pkgname"
	patch -p1 <$srcdir/timeout.patch
}

package() {
	cd "$pkgname"
	install -Dm0755 imaputils.pl $pkgdir/usr/bin/imaputils.pl
	install -Dm0644 README $pkgdir/usr/share/doc/$pkgname/README
}
