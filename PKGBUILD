# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-www-mechanize'
pkgver='1.60'
pkgrel='2'
pkgdesc="Testing-specific WWW::Mechanize subclass"
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl-carp-assert-more>=1.16' 'perl-html-form>=0' 'perl-html-parser>=0' 'perl-http-message>=6.29' 'perl-http-server-simple>=0.42' 'perl-test-longstring>=0.15' 'perl-uri>=0' 'perl-www-mechanize>=1.68' 'perl-libwww>=0' 'perl>=5.010')
checkdepends=('perl-html-lint' 'perl-html-tree' 'perl-test-pod' 'perl-test-pod-coverage')
optdepends=('perl-html-lint: autolinting')
url='https://metacpan.org/release/Test-WWW-Mechanize'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/Test-WWW-Mechanize-1.60.tar.gz')
md5sums=('f14a2b64c39ec2536456b85a295f9074')
sha512sums=('86213bcbcd5d0f2565827ad692a190084552a5f6ddfd376729332ab67eb8cf54a622c23e4e3d5f21c29009ee2ed10036340499cff1e8c522c696d0a0bcfd65c1')
_distdir="Test-WWW-Mechanize-1.60"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
