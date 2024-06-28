# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-html-fromansi-tiny'
pkgver='0.107'
pkgrel='1'
pkgdesc="Perl/CPAN Module HTML::FromANSI::Tiny: Easily convert colored command line output to HTML"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006' 'perl-html-parser' 'perl-parse-ansicolor-tiny>=0.600')
makedepends=()
checkdepends=('perl-test-differences' 'perl-test-requires')
url='https://metacpan.org/release/HTML-FromANSI-Tiny'
source=("http://search.cpan.org/CPAN/authors/id/R/RW/RWSTAUNER/HTML-FromANSI-Tiny-$pkgver.tar.gz")
md5sums=('fa753b4a1c26c7ab572f4a3bb3ecde28')
sha512sums=('12858157c14ae808f59e4856fb62247f4f8073bb68e617cfc191f3615e22038041b9262a3e45926a61f4ec767b52057328845e378b5f0851d343c3c80a17ea1a')
_distdir="HTML-FromANSI-Tiny-$pkgver"

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
