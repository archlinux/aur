# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-crypt-hce-md5'
pkgver='0.70'
pkgrel='1'
pkgdesc="Perl extension implementing one way hash chaining encryption using MD5"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Crypt-HCE_MD5'
source=('http://search.cpan.org/CPAN/authors/id/E/EE/EESTABROO/Crypt-HCE_MD5-0.70.tar.gz')
md5sums=('2fca1b79ee1a83854938f5c7711a19be')
sha512sums=('d67c36389ac1a1d4bcbdb96325bd449a38fdb65d159e8283008b371a020599711666b446b094f59bde21819d5797f6184ea45a491ea7b97eedb1f3f51e0506ae')
_distdir="Crypt-HCE_MD5-0.70"

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
