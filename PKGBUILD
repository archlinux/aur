# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-b-utils'
pkgver='0.27'
pkgrel='1'
pkgdesc="Helper functions for op tree manipulation"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-task-weaken' 'perl>=5.006')
makedepends=('perl-test-reporter')
url='https://metacpan.org/release/B-Utils'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/B-Utils-0.27.tar.gz')
md5sums=('340d6461afcec016ce6d0a0ba27290ba')
sha512sums=('a896476f59a424fa9062c5dfe6431493c020e51746fa7f7b4c7fcdb109d1c0fa252292b891263d676884f064db95f16958a5d2ed5981dc5997436dced6579e74')
_distdir="B-Utils-0.27"

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
