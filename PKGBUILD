# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-bundle-cpan'
pkgver='1.861'
pkgrel='1'
pkgdesc="Bundle to optimize the behaviour of CPAN.pm"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Bundle-CPAN'
source=('http://search.cpan.org/CPAN/authors/id/A/AN/ANDK/Bundle-CPAN-1.861.tar.gz')
md5sums=('c77297b18fe9e1cd38829787700c3bd6')
sha512sums=('22a64474bc7651012880c6d1afadc45e90f23554329f905b04cfb4029eaefcc5d836956b6fcae4b37af7723c9bfdf9e581dcce2971536eead29426bee9feb771')
_distdir="Bundle-CPAN-1.861"

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
