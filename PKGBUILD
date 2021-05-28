# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mousex-simpleconfig'
pkgver='0.11'
pkgrel='2'
pkgdesc="A Mouse role for setting attributes from a simple configfile"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-config-any>=0.13' 'perl-mouse>=0.35' 'perl-mousex-configfromfile>=0.02' 'perl-path-class>=0')
makedepends=()
url='https://metacpan.org/release/MouseX-SimpleConfig'
source=('https://cpan.metacpan.org/authors/id/M/MJ/MJGARDNER/MouseX-SimpleConfig-0.11.tar.gz')
md5sums=('4329bd0350d781baa59271b3f6699984')
sha512sums=('e3095b10e12b165436cc1463446492474a4cdc20f2395b7b103b1015ae8d24fa145a7ad986d1bcf0a1bbaf157ec7f93b194eaf2931a6dc19b1cf61eb97031715')
_distdir="MouseX-SimpleConfig-0.11"

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
