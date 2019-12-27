# Contributor: Tyler Swagar <buttpickle69@shaw.ca>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojolicious'
pkgver='8.28'
pkgrel='1'
pkgdesc="Real-time web framework"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.1')
makedepends=()
url='https://metacpan.org/release/Mojolicious'
source=("https://cpan.metacpan.org/authors/id/S/SR/SRI/Mojolicious-${pkgver}.tar.gz")
md5sums=('03057d8e9cac89cc3b797c5fad299187')
sha512sums=('60cad23411bd1827fd592f5249443a95c98c59e5f7f715dbd74d7c32fd2d5e894ee2b229bb36e688286edfb80352f74fd69fa8c316fc94d901f49a065711c557')
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
