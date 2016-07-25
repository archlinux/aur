# CPAN Name  : Authen-Simple-LDAP
# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Christian Hesse <mail@earthworm.de>

pkgname='perl-authen-pam'
pkgver='0.16'
pkgrel='2'
pkgdesc="Perl interface to PAM library"
arch=('any')
url="http://search.cpan.org/~nikip/Authen-PAM-$pkgver/"
license=('unknown')
depends=('perl')

options=('!emptydirs')

source=("http://search.cpan.org/CPAN/authors/id/N/NI/NIKIP/Authen-PAM-$pkgver.tar.gz")
md5sums=('7278471dfa694d9ef312bc92d7099af2')

build() {
  cd ${srcdir}/Authen-PAM-$pkgver
  export PERL_AUTOINSTALL=--skipdeps PERL_MM_USE_DEFAULT=1
  cd "$DIST_DIR"
  perl Makefile.PL INSTALLDIRS=vendor
  make
  }

package() {
  cd ${srcdir}/Authen-PAM-$pkgver
  make DESTDIR="$pkgdir" install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
