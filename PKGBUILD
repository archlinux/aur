# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-autobox'
pkgver='2.83'
pkgrel='1'
pkgdesc="call methods on native types"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-scope-guard>=0.20' 'perl>=5.8.0')
makedepends=()
url='http://search.cpan.org/dist/autobox'
source=('http://search.cpan.org/CPAN/authors/id/C/CH/CHOCOLATE/autobox-2.83.tar.gz')
md5sums=('7a4b2c4c644e6f02ccb1d964fabebde5')
sha512sums=('2c347ee61240ba7ba8fdf0bddebceab554c602ce673a524255a73ee7b53a9765f9679bd613f796f74e6588ebfd6beb877fa6f49720fa6da108f91ebb365b1dc6')
_distdir="autobox-2.83"

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
