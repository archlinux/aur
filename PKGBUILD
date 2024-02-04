# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-www-mechanize-gzip'
pkgver='0.14'
pkgrel='1'
pkgdesc="tries to fetch webpages with gzip-compression"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-www-mechanize>=0')
makedepends=()
url='https://metacpan.org/release/WWW-Mechanize-GZip'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PEGI/WWW-Mechanize-GZip-0.14.tar.gz')
md5sums=('133532215755cf62f83ac5077f53afdd')
sha512sums=('091d02f423cb12684e6127f6cdcc43a6d1c5b589ce5463e7d420b6cb6788cd1144709f3bbaf89e74a087c101c43cee25c284b11a8e94b7cd9bec1b766e24eb4e')
_distdir="WWW-Mechanize-GZip-0.14"

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
