# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-weather-com'
pkgver='0.5.3'
pkgrel='1'
pkgdesc="fetching weather information from weather.com"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-libwww' 'perl-time-format>=1.0' 'perl-uri' 'perl-xml-simple')
makedepends=()
url='http://search.cpan.org/dist/Weather-Com'
source=('http://search.cpan.org/CPAN/authors/id/S/SC/SCHNUECK/Weather-Com-0.5.3.tar.gz')
md5sums=('b4432b0e87f9dd53cb06979b2c8a6b1a')
sha512sums=('4c81349382d329d335ec241525fbb781e3fff82ec470bf6681970d194b661d446ecede1a8b93940d29c16766542bdbc6b7c8ba4eb986f708a7b8416c181a0d7e')
_distdir="Weather-Com-0.5.3"

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
