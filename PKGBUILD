# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-getopt-euclid'
pkgver='0.4.5'
pkgrel='1'
pkgdesc="Executable Uniform Command-Line Interface Descriptions"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Getopt-Euclid'
source=('http://search.cpan.org/CPAN/authors/id/F/FA/FANGLY/Getopt-Euclid-0.4.5.tar.gz')
md5sums=('4f5636af10a0939798bc7864a4dfdfab')
sha512sums=('4a359aa53103c429bb1724f14961998cc879643573d955e935af9bb757fdbbe40f1276f3a15515011602e56eaf538fa7f30185e3050eb1f83948018b0806bbd4')
_distdir="Getopt-Euclid-0.4.5"

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
