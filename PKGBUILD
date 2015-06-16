# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xml-xspf'
pkgver='0.7'
pkgrel='1'
pkgdesc="API for reading & writing XSPF Playlists"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor>=0.20' 'perl-html-parser' 'perl-timedate' 'perl-xml-parser>=2.30' 'perl-xml-writer>=0.600')
makedepends=()
url='http://search.cpan.org/dist/XML-XSPF'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DANIEL/XML-XSPF-0.7.tar.gz')
md5sums=('61d5ed1545daec410865daf255cdb6a5')
sha512sums=('5757636d807314ef1dc10c82ac063227810a84cedca64e345d23ae8ef9003a952cd2358a11c9b32c0c5e31070c4928838386af72b3eec24ca894e7857ddaa16f')
_distdir="XML-XSPF-0.7"

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
