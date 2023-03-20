# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-hash-safekeys'
pkgver='0.04'
pkgrel='1'
pkgdesc="get hash contents without resetting each iterator"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Hash-SafeKeys'
source=('http://search.cpan.org/CPAN/authors/id/M/MO/MOB/Hash-SafeKeys-0.04.tar.gz')
md5sums=('a6f290a737cb7086e2fba35b4417d6ee')
sha512sums=('bb1bec9e4bedcaaf20c8fd22c46650025f005b1db1888c01752df4690878268ee1ade9b1a2ce6588cfcf66fd651aa359843e3228fc9620b18a787427c2dc566a')
_distdir="Hash-SafeKeys-0.04"

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
