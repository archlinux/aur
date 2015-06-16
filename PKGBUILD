# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-class-tiny'
pkgver='1.001'
pkgrel='1'
pkgdesc="Minimalist class construction"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Class-Tiny'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Class-Tiny-1.001.tar.gz')
md5sums=('2a5bfa3a8bb50a1ea930fa97514eeed4')
sha512sums=('7d64a78f72edb249b988da9ab7e4769f2721030eeb1dd3e111f1d0ae2bed76ea6ee0d5feb30867eaf78f0d436ff2e72f701cb2c51d53ce40bb0840f9b3c33dc7')
_distdir="Class-Tiny-1.001"

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
