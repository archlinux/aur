# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-www-mechanize-catalyst'
pkgver='0.60'
pkgrel='1'
pkgdesc="Test::WWW::Mechanize for Catalyst"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime>=0' 'perl-class-load>=0.19' 'perl-moose>=0.67' 'perl-test-www-mechanize>=1.14' 'perl-www-mechanize>=1.54' 'perl-libwww>=0' 'perl-namespace-clean>=0.09' 'perl>=5.8.4')
makedepends=('perl-catalyst-plugin-session>=0' 'perl-catalyst-plugin-session-state-cookie>=0' 'perl-test-exception>=0' 'perl-test-utf8>=0')
url='https://metacpan.org/release/Test-WWW-Mechanize-Catalyst'
source=('http://search.cpan.org/CPAN/authors/id/J/JJ/JJNAPIORK/Test-WWW-Mechanize-Catalyst-0.60.tar.gz')
md5sums=('ed35bc5fbde82b69f5d05d4f6bdc9a5a')
sha512sums=('ede9a01d0124ac798d336f813d1380ab8e8a73ff8f436961db44439a8d1c43aa21adbd9d9c538d79040456f7be0451773fd01b46f82307221a17a0d3d7a079a3')
_distdir="Test-WWW-Mechanize-Catalyst-0.60"

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
