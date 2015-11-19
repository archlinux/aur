# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-lib-abs'
pkgver='0.93'
pkgrel='1'
pkgdesc="C<lib> that makes relative path absolute to caller."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.0')
makedepends=()
url='https://metacpan.org/release/lib-abs'
source=('http://search.cpan.org/CPAN/authors/id/M/MO/MONS/lib-abs-0.93.tar.gz')
md5sums=('5fd0de8756a76bafb61abae49ca74e2e')
sha512sums=('b9927ac7ebac7a415fedbd801d83b7083a0897a3566f34ed5c0aa5edc1be18aed66314e9899163719879eecf59c1b4f45d6c825a07357b352ff6aab612fac775')
_distdir="lib-abs-0.93"

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
