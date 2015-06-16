# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-gtop'
pkgver='0.18'
pkgrel='1'
pkgdesc="Perl interface to libgtop"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glib2>=2.36.3' 'libgtop>=2.28.4' 'perl')
makedepends=()
url='http://search.cpan.org/dist/GTop'
source=('http://search.cpan.org/CPAN/authors/id/M/MJ/MJH/GTop-0.18.tar.gz')
md5sums=('5652bdbbe1aed5577ab8e72c88b9740f')
sha512sums=('478eace21f8836b38434c0521063303117489784567945f940f170aa3022f4a1241ec646368aee0353de6f5a791a79c3de27b273815af5be458e766799b5944f')
_distdir="GTop-0.18"

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
