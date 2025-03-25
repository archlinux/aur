# Maintainer : int <int [ate] arcor [dot] de>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-datetime-format-flexible'
pkgver='0.37'
pkgrel='1'
pkgdesc="Perl/CPAN Module DateTime::Format::Flexible: Flexibly parse strings and turn them into DateTime objects."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime' 'perl-datetime-format-builder>=0.74' 'perl-datetime-timezone')
makedepends=()
checkdepends=('perl-test-exception' 'perl-test-mocktime' 'perl-test-nowarnings')
url='https://metacpan.org/release/DateTime-Format-Flexible'
source=("http://search.cpan.org/CPAN/authors/id/T/TH/THINC/DateTime-Format-Flexible-$pkgver.tar.gz")
md5sums=('9e9755b94ca7ed3ad6115c519d848935')
sha512sums=('730041a7ddfba9fbeb29846354fc6f326ec54c46f2e826b0bcedae86afd5de92aa7304ec73c22c1bc8acb1d5db75c89cbaf54d6bc78c98a77be9f88e616cb2a1')
_distdir="DateTime-Format-Flexible-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
