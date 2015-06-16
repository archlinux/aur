# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-plugin-cache-store-fastmmap'
pkgver='0.02'
pkgrel='1'
pkgdesc="DEPRECATED - FastMmap cache store"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cache-fastmmap' 'perl-catalyst-plugin-cache>=0.01' 'perl-catalyst-runtime' 'perl-path-class')
makedepends=()
url='http://search.cpan.org/dist/Catalyst-Plugin-Cache-Store-FastMmap'
source=('http://search.cpan.org/CPAN/authors/id/N/NU/NUFFIN/Catalyst-Plugin-Cache-Store-FastMmap-0.02.tar.gz')
md5sums=('0180d977ad2060a2579a4a3a77d0a1f3')
sha512sums=('de9598fdf9c67f15e6574228eff40ef31e12d8e945ebabd1ee084112455dafbca57f08a39335b9b5723b389d9f84868d3899069d1cdbf5874c86baf0da99315a')
_distdir="Catalyst-Plugin-Cache-Store-FastMmap-0.02"

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
