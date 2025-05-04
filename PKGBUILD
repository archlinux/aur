# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-software-license'
pkgver='0.104006'
pkgrel='2'
pkgdesc="packages that provide templated software licenses"
arch=('any')
license=('Artistic-1.0-Perl'
         'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-data-section>=0' 'perl-text-template>=0' 'perl-try-tiny>=0' 'perl>=5.012')
makedepends=()
url='https://metacpan.org/dist/Software-License'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Software-License-${pkgver}.tar.gz")
sha512sums=('48fbfc5419a978b645c822d529f94c54a49ba65502165cfcc4ee6a6b48ea59eff981e5f64b9a9109007c389897789a9b9651f980b8b2ebd07180310da2e720bb')
_distdir="Software-License-${pkgver}"

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
