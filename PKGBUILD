# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-courriel'
pkgver='0.39'
pkgrel='1'
pkgdesc="High level email parsing and manipulation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime' 'perl-datetime-format-mail' 'perl-datetime-format-natural' 'perl-devel-partialdump' 'perl-email-abstract' 'perl-email-address' 'perl-email-mime-encodings' 'perl-email-messageid' 'perl-file-libmagic' 'perl-file-slurp-tiny' 'perl-list-allutils' 'perl-list-moreutils>=0.28' 'perl-moose' 'perl-moosex-params-validate>=0.21' 'perl-moosex-role-parameterized' 'perl-moosex-strictconstructor' 'perl-moosex-types' 'perl-moosex-types-common' 'perl-sub-exporter' 'perl-namespace-autoclean' 'perl>=5.10.0')
makedepends=()
checkdepends=('perl-test-differences' 'perl-test-fatal' 'perl-test-requires')
url='https://metacpan.org/release/Courriel'
source=('http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Courriel-0.39.tar.gz')
md5sums=('e96ed4029f5d92aa481b2351b9cb9058')
sha512sums=('b138cbfc3285b597c00987e1d04cec11435c9ea946d7ac71031cfa008acbf8105bb5b7d4c07852494a504214dfae719ca8c4261d8cbaf6030a142205e1a8c47e')
_distdir="Courriel-0.39"

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
