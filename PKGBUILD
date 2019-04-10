# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-term-encoding'
pkgver='0.03'
pkgrel='1'
pkgdesc="Detect encoding of the current terminal"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Term-Encoding'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Term-Encoding-0.03.tar.gz')
md5sums=('84d75760e8ce2898675eb384748cb200')
sha512sums=('781be5087b65e90267daa3efa95bd03b3f2b2f8b3c8aac492238159c0dea3dfef7a82acded856b9551d389e2fcf5baf19a4ff9924da35377d28616b49015a0ce')
_distdir="Term-Encoding-0.03"

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
