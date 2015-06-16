# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-www-mechanize-gzip'
pkgver='0.12'
pkgrel='1'
pkgdesc="tries to fetch webpages with gzip-compression"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-www-mechanize>=0')
makedepends=()
url='http://search.cpan.org/dist/WWW-Mechanize-GZip'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PEGI/WWW-Mechanize-GZip-0.12.tar.gz')
md5sums=('c3475fcff561629dddbd25b9db611e49')
sha512sums=('056e9230660f4de922c02001cbc072ddd724d6d07ddaa602a6e0f4b1faded504777322d139fc5d2c1903378f6ef27019404dd02b4a279e931171faff682a728c')
_distdir="WWW-Mechanize-GZip-0.12"

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
