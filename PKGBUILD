# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-refcount'
pkgver='0.08'
pkgrel='1'
pkgdesc="assert reference counts on objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Test-Refcount'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/Test-Refcount-0.08.tar.gz')
md5sums=('bcf11e5f0103568674bcc15d2168932e')
sha512sums=('9a5ffe332f9a61c2f019963f49117f4a6af0b855371cd6aa24cc5e3edd7ee6caa54f25bcdd1edf57044c764030f8db37a1ee232d49130656643135cfac96d570')
_distdir="Test-Refcount-0.08"

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
