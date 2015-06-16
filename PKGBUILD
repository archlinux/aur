# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-cpanplus-dist-deb'
pkgver='0.12'
pkgrel='1'
pkgdesc="CPANPLUS plugin to create debian packages on the fly"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-yaml')
makedepends=()
url='http://search.cpan.org/dist/CPANPLUS-Dist-Deb'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KANE/CPANPLUS-Dist-Deb-0.12.tar.gz')
md5sums=('63395c87a42a292cd9291a3665194de8')
sha512sums=('7006df15f5b566cd82f1bd34c2eaef1572aa3eb0c1fb4c20d9ad2b160e561377dc456dc1951d92ca76e18784d1696032dc3780dc4bf09d789f9574e067de059d')
_distdir="CPANPLUS-Dist-Deb-0.12"

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
