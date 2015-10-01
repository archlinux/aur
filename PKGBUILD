# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-config-mvp-reader-ini'
pkgver='2.101463'
pkgrel='1'
pkgdesc="an MVP config reader for .ini files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-config-ini' 'perl-config-mvp>=2' 'perl-moose')
makedepends=()
url='https://metacpan.org/release/Config-MVP-Reader-INI'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Config-MVP-Reader-INI-2.101463.tar.gz')
md5sums=('4ea590bd37b92917551f2f6265000cca')
sha512sums=('79e65082058fa7c5ae24e8deb69c0f17dafe9727c57c7fdb4fc2cbc4f634b424c8d1a17e16f879b879769b3030f9f7cf555d9f582db6df83a33ea86141449e54')
_distdir="Config-MVP-Reader-INI-2.101463"

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
