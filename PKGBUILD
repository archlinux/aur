# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-aggregate'
pkgver='0.366'
pkgrel='1'
pkgdesc="Aggregate *.t tests to make them run faster."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-test-most>=0.21' 'perl-test-nowarnings' 'perl-test-trap')
makedepends=()
url='http://search.cpan.org/dist/Test-Aggregate'
source=('http://search.cpan.org/CPAN/authors/id/R/RW/RWSTAUNER/Test-Aggregate-0.366.tar.gz')
md5sums=('cfad8ddb20ca360ded09f3694811dacf')
sha512sums=('622c0246e71ab54308b3f55b966af7063f8430eb30939bb3ae698698fcc7315e165f028acfc57000b6f8cda9537979376508c450633f28bf696a22fb3f41706e')
_distdir="Test-Aggregate-0.366"

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
