pkgname=imaputils
pkgver=20191107
pkgrel=1
pkgdesc="perl script for managing/searching mail on an IMAP servers from the command line"
arch=(any)
url="https://sourceforge.net/projects/imaputils/files/"
license=('BSD')
depends=('perl-mail-imapclient' 'perl-datetime-format-mail' 'perl-datetime' 'perl-io-socket-ssl' 'socat')
source=("$pkgname::git://git.code.sf.net/p/imaputils/git")
md5sums=('SKIP')

prepare() {
	cd "$pkgname"
	sed -i 's|/etc/pki/ca-trust/extracted/pem|/etc/ca-certificates/extracted|g' imaputils.pl
}

package() {
	cd "$pkgname"
	install -Dm0755 imaputils.pl $pkgdir/usr/bin/imaputils.pl
	install -Dm0644 README $pkgdir/usr/share/doc/$pkgname/README
}
