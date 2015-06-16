# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-www-scripter'
pkgver='0.030'
pkgrel='1'
pkgdesc="For scripting web sites that have scripts"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-css-dom' 'perl-html-dom>=0.045' 'perl-http-message>=1.34' 'perl-libwww' 'perl-uri' 'perl-www-mechanize>=1.52')
makedepends=()
url='http://search.cpan.org/dist/WWW-Scripter'
source=('http://search.cpan.org/CPAN/authors/id/L/LX/LXP/WWW-Scripter-0.030.tar.gz')
md5sums=('e1b42bca9a0e43474a9ad6e4d007adbd')
sha512sums=('f44457ca9235350788b9e35dd68a4fe58f875912d7d89adb9b2f6bd34024b46cf57f3e704ba36c6441c01f37c49efab0cb8c156e0daff21c4d1a245c89e1c541')
_distdir="WWW-Scripter-0.030"

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
