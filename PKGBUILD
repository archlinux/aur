# Contributor: Tyler Swagar <buttpickle69@shaw.ca>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojolicious'
pkgver='8.0'
pkgrel='1'
pkgdesc="Real-time web framework"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.1')
makedepends=()
url='https://metacpan.org/release/Mojolicious'
source=("https://cpan.metacpan.org/authors/id/S/SR/SRI/Mojolicious-${pkgver}.tar.gz")
md5sums=('0da107065c24368a15af807e31afcc30')
sha512sums=('19126a663c52a45f1f32354567b97922453b542073308d2b7288f9deb568f598a2e7ed5b6db377bcb152437c942ed47f8fd805fae80d3f54db02d3a7160cc94e')
_distdir="Mojolicious-${pkgver}"

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
