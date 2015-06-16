# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-class-accessor-lite'
pkgver='0.05'
pkgrel='1'
pkgdesc="a minimalistic variant of Class::Accessor"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Class-Accessor-Lite'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAZUHO/Class-Accessor-Lite-0.05.tar.gz')
md5sums=('c487f0ebe2038363b68e9e68ae4beb54')
sha512sums=('cee27783cc8c367a066cf941d034216fd4d70482825734d15bf4db818f83e0d96a9a4c5d171f1ceccb63ce7175e4df8cf42da58f413915c6190dde301ce738b2')
_distdir="Class-Accessor-Lite-0.05"

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
