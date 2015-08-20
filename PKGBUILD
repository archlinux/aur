# Contributor:  boteium <echo Ym90ZWl1bUBnbWFpbC5jb20=|base64 -d>

pkgname=perl-auth-googleauthenticator
pkgver=0.0.3
pkgrel=1
pkgdesc="Perl/CPAN module Auth::Google::Authenticator"
url="http://search.cpan.org/~CORION/Auth-GoogleAuthenticator-0.03"
license="GPL"
arch=('any')
source=('http://search.cpan.org/CPAN/authors/id/C/CO/CORION/Auth-GoogleAuthenticator-0.03.tar.gz')
md5sums=('dd2950c295f140afdbe52556a52eb530')

build() {
  cd  "$srcdir/Auth-GoogleAuthenticator-0.03"
  /usr/bin/perl Makefile.PL \
      INSTALLSITELIB=/usr/lib/perl5/site_perl/
  /usr/bin/make || return 1
}

package(){
  cd  "$srcdir/Auth-GoogleAuthenticator-0.03"
  /usr/bin/make DESTDIR=$pkgdir/ install
  /usr/bin/find $startdir/pkg -name '.packlist' -delete
  /usr/bin/find $startdir/pkg -name '*.pod' -delete
}
