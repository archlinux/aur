# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-uri-cpan'
pkgver='1.008'
pkgrel='1'
pkgdesc="URLs that refer to things on the CPAN"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpan-distnameinfo>=0' 'perl-uri>=0' 'perl>=5.012')
makedepends=()
url='https://metacpan.org/release/URI-cpan'
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/URI-cpan-${pkgver}.tar.gz")
md5sums=('c1e78398e8887c431b36825dc762daa4')
sha512sums=('07918c561b30d8a193df265c14467cb3bb5484686e52296462a8d031b19d490a9d5e3b18e2856a8ecbe1f0841e1c56466a81b214e252cadd17740bcef50f6056')
_distdir="URI-cpan-${pkgver}"

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
