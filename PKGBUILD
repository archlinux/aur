# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-app-cache'
pkgver='0.37'
pkgrel='1'
pkgdesc="Easy application-level caching"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor-chained' 'perl-file-find-rule' 'perl-file-homedir' 'perl-http-cookies' 'perl-libwww' 'perl-path-class')
makedepends=()
url='http://search.cpan.org/dist/App-Cache'
source=('http://search.cpan.org/CPAN/authors/id/L/LB/LBROCARD/App-Cache-0.37.tar.gz')
md5sums=('9c9f822c684de101bc64dae8fd5805d1')
sha512sums=('7412b2fb598aafacecc1aa8c887d0c9d8a40bcd2b66b98786cea32818934784b096d52f4cfefcac3d4713e427f6000bddb7e5db225cdf8b649214aaad34afcff')
_distdir="App-Cache-0.37"

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
