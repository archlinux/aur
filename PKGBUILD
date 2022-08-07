# Maintainer: Dian M Fay <dian dot m dot fay at gmail dot com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-algorithm-backoff
pkgver=0.009
pkgrel=1
pkgdesc="Various backoff strategies for retry"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.1')
makedepends=()
checkdepends=('perl-test-exception>=0' 'perl-test-number-delta>=0')
url='https://metacpan.org/release/Algorithm-Backoff'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PERLANCAR/Algorithm-Backoff-0.009.tar.gz')
md5sums=('edcad674b720e218fa049c857da088ea')
sha512sums=('e3764518941d11f6dcd0b69aa6206bf382a7ad00ad77eee96493ae237ffd0a6a54b1796e8947974a112fe5fcf6b148fc60c9d1cf8b073ee9b4a22e44640bccfc')
_distdir="Algorithm-Backoff-0.009"

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
