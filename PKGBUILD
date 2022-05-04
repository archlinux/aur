# Maintainer : int <int [ate] arcor [dot] de>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-datetime-format-flexible'
pkgver='0.34'
pkgrel='1'
pkgdesc="Perl/CPAN Module DateTime::Format::Flexible: Flexibly parse strings and turn them into DateTime objects."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime' 'perl-datetime-format-builder>=0.74' 'perl-datetime-timezone' 'perl-list-moreutils')
makedepends=()
checkdepends=('perl-test-exception' 'perl-test-mocktime' 'perl-test-nowarnings')
url='https://metacpan.org/release/DateTime-Format-Flexible'
source=("http://search.cpan.org/CPAN/authors/id/T/TH/THINC/DateTime-Format-Flexible-$pkgver.tar.gz")
md5sums=('b4e87105404926988df7b4391548c317')
sha512sums=('2b2d730aaa9c8f6152f57493b8a0b2f9600b06dcdf2776bd1cb3fbf26c3b5ab31351a32fccb5072ed7410b558354fb3f9e3e8fa5af99da846fc623ae25e1f763')
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
