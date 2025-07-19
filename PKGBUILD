# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-software-license'
pkgver='0.104007'
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
sha512sums=('12d75e9583b3013d9b4a282467f1ac80ab6b7f3251926d66591d01404489b528f22adc396dfd4528a0f0ca650f0eed6d9c959e69eace2169c6ed1cfffe5277e4')
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
