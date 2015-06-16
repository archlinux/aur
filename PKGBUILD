# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-moosex-nonmoose'
pkgver='0.26'
pkgrel='1'
pkgdesc="easy subclassing of non-Moose classes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-list-moreutils' 'perl-module-runtime' 'perl-moose' 'perl-try-tiny')
makedepends=()
checkdepends=('perl-test-fatal')
url='http://search.mcpan.org/dist/MooseX-NonMoose'
source=('http://search.mcpan.org/CPAN/authors/id/D/DO/DOY/MooseX-NonMoose-0.26.tar.gz')
md5sums=('8a226451ba312c21a27376741c302f47')
sha512sums=('3f3bb494439af198a49e343df7c2e6ceae5a227c143cddd36e6f8f9f85c30108117ce2f12d9cea89713820790081b363a57f9798e660994568db11c9fb224612')
_distdir="MooseX-NonMoose-0.26"

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
