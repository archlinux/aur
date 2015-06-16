# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-mp3-m3u-parser'
pkgver='2.31'
pkgrel='1'
pkgdesc="MP3 playlist parser."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-text-template')
makedepends=()
url='http://search.cpan.org/dist/MP3-M3U-Parser'
source=('http://search.cpan.org/CPAN/authors/id/B/BU/BURAK/MP3-M3U-Parser-2.31.tar.gz')
md5sums=('b55900f7e2783b9ffb66f7a0ca41c02a')
sha512sums=('bf3971b0f55b18eda3af9d5230106c8fac723710598f22ecb9c841c6535a694300c7c259c18c548a56bc45485cae2b9a2c1e3a1246f5c844577abaad988a53ec')
_distdir="MP3-M3U-Parser-2.31"

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
