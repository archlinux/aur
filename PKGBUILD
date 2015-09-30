# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-string-formatter'
pkgver='0.102084'
pkgrel='1'
pkgdesc="build sprintf-like functions of your own"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-params-util' 'perl-sub-exporter')
makedepends=()
url='https://metacpan.org/release/String-Formatter'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/String-Formatter-0.102084.tar.gz')
md5sums=('0078728532a8a8e23be4fa4ef8387ad0')
sha512sums=('d9e72e01b78d9b571cde6cb0107e334e41739b07006e224016cff5de4648b9f924003446de75ddfd911bfc25b3046554cde09502344dce53a8fed2ecfd7994dc')
_distdir="String-Formatter-0.102084"

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
