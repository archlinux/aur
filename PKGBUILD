# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-parallel-prefork'
pkgver='0.14'
pkgrel='1'
pkgdesc="A simple prefork server framework"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-class-accessor-lite>=0.04' 'perl-list-moreutils' 'perl-proc-wait3>=0.03' 'perl-scope-guard')
makedepends=('perl-test-requires' 'perl-test-sharedfork')
url='http://search.cpan.org/dist/Parallel-Prefork'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAZUHO/Parallel-Prefork-0.14.tar.gz')
md5sums=('223570b872af5ec337e3fdc31e47d7e0')
sha512sums=('18a9155775779d85956492f252f87e543590e4b4403f40fd4da86f041784b344683d88db49137cdad1e5d22c6f1017453bab7c0e1fb38731933194a32015547a')
_distdir="Parallel-Prefork-0.14"

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
