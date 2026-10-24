# Maintainer: Elias Elwyn <a@jthvai.net>
# Contributor: René Wagner <rwagner at rw-net dot de>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-number-format'
pkgver=1.79
pkgrel='1'
pkgdesc="Perl extension for formatting numbers"
arch=('any')
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/pod/Number::Format'
source=("https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Number-Format-${pkgver}.tar.gz")
sha256sums=('404b231709b28a41024ae76bedd349145da7e535f94c6013b6bb55eea383e1ad')
_distdir="Number-Format-${pkgver}"

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
