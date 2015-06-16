# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-io-zlib'
pkgver='1.10'
pkgrel='1'
pkgdesc="IO:: style interface to Compress::Zlib"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/IO-Zlib'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOMHUGHES/IO-Zlib-1.10.tar.gz')
md5sums=('078a9387009b928068f70759e61bd08f')
sha512sums=('e40fd2e24bc6fc15a39774e94bea8869db503b9c8d2af14389e7d8e29a623a0f0d46939fa2490d743e5def074595fdbcbd9fc072a6351fe5636693476b017dd9')
_distdir="IO-Zlib-1.10"

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
