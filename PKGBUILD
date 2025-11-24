# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-perl-version'
pkgver='1.018'
pkgrel='1'
pkgdesc="Parse and manipulate Perl version strings"
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl>=5.010')
makedepends=()
url='https://metacpan.org/release/Perl-Version'
source=('http://search.cpan.org/CPAN/authors/id/B/BR/BRIANDFOY/Perl-Version-1.018.tar.gz')
md5sums=('3eba36d12f420b5b66135f6f5f1cb4ea')
sha512sums=('fb8f3cb8db5c8110ae2d68667e5491c9b63ffd24c717d9d4c4ff04a938c503a2d49abcd59fd9b21cfc157a6f5b59369248a166e5cd6e911180eef9e8f14d0527')
_distdir="Perl-Version-1.018"

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
