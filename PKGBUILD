# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-date-range'
pkgver='1.41'
pkgrel='3'
pkgdesc="work with a range of dates"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-date-simple>=0.03')
url='https://metacpan.org/release/Date-Range'
source=('http://search.cpan.org/CPAN/authors/id/T/TM/TMTM/Date-Range-1.41.tar.gz')
sha512sums=('452672d6050805c0a5743d49e278925df8d2d44b3f2ffc5c69dc6520ae4cbf54847baa905a35290375bb200bf3c74a2a862c54bcd57ee9ef0f513e3ccdc07f93')
_distdir="Date-Range-1.41"

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
