# Maintainer : int <int [ate] arcor [dot] de>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-indirect'
pkgver='0.38'
pkgrel='1'
pkgdesc="Perl/CPAN Module indirect: Lexically warn about using the indirect method call syntax."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/indirect'
source=("http://search.cpan.org/CPAN/authors/id/V/VP/VPIT/indirect-$pkgver.tar.gz")
md5sums=('c4e2da06c6bd0cc4f7ba5a318bae7f15')
sha512sums=('1ae363d2b2961be8495168a870bf941953a7845b0f3e9c7e9b267affc0b0392e1747ca4edd484ac98ddeef70b1a1cf28672bf1b9289847cb193409914e2f4673')
_distdir="indirect-$pkgver"

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
