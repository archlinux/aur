# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-size'
pkgver='0.83'
pkgrel='2'
pkgdesc="Perl extension for finding the memory usage of Perl variables"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.005')
makedepends=()
url='https://metacpan.org/release/Devel-Size'
source=('http://search.cpan.org/CPAN/authors/id/N/NW/NWCLARK/Devel-Size-0.83.tar.gz')
md5sums=('0b5335d69402c75d5ab9978027ae2f66')
sha512sums=('cacc484d57b66bf84b92297c594635f41310ddcd87c6f60a36669cd9c9a6e1405b19a5bbf0d57d795b8e45c9e6c470d84bf56384c0c48637cc0617c5070c31e6')
_distdir="Devel-Size-0.83"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
