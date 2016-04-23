# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-exporter-easy'
pkgver='0.18'
pkgrel='1'
pkgdesc="Takes the drudgery out of Exporting symbols"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Exporter-Easy'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/Exporter-Easy-0.18.tar.gz')
md5sums=('aaa738fc934725c12f54eaa3a1eace78')
sha512sums=('f57782bf9444831f613c2410f08a6414f0cb14fb25ed3a76f48c7385ebe5c615e7cb142de0b3d4038e4a5ea38d51da76432541807385d54fbf96b71887b357de')
_distdir="Exporter-Easy-0.18"

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
