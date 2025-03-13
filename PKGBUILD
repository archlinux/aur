# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-catalyst-authentication-credential-http'
pkgver='1.018'
pkgrel='2'
pkgdesc="HTTP Basic and Digest authentication for Catalyst"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-catalyst-plugin-authentication>=0' 'perl-catalyst-runtime>=0' 'perl-class-accessor>=0' 'perl-data-uuid>=0.11' 'perl-http-message>=0' 'perl-string-escape>=0' 'perl-uri>=0' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-exception>=0' 'perl-test-mockobject>=0' 'perl-test-needs>=0' 'perl-perlio-utf8-strict')
url='https://metacpan.org/release/Catalyst-Authentication-Credential-HTTP'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Catalyst-Authentication-Credential-HTTP-${pkgver}.tar.gz")
md5sums=('53ade94495ee45b5ff2871e5a241653d')
sha512sums=('61dfcb2c42eea0b44bfda52681fd57d54a97cc830b9d1ce22838c4b8e8bf08f0a92c12fb2b434c89c194215af85d8be6e13083685597bec5f9b4dadeacca01d3')
_distdir="Catalyst-Authentication-Credential-HTTP-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
