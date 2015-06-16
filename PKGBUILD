# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-pod-pom'
pkgver='0.28'
pkgrel='1'
pkgdesc="POD Object Model"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=('perl-file-slurp')
url='http://search.cpan.org/dist/Pod-POM'
source=('http://search.cpan.org/CPAN/authors/id/A/AN/ANDREWF/Pod-POM-0.28.tar.gz')
md5sums=('808ae281809e7bdf3fc8ef4e0b7487a9')
sha512sums=('d154509505eadb019994fa52d8013ead0eea8f1304330923a2093980478ad113c72fd0da0a26829ab752234d884d2bda16cbc7ddc17975852e3a86dd496b177f')
_distdir="Pod-POM-0.28"

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
