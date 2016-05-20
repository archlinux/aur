# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-script'
pkgver='1.12'
pkgrel='1'
pkgdesc="Basic cross-platform tests for scripts"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-ipc-run3>=0.034' 'perl-probe-perl>=0.01' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Test-Script'
source=('http://search.cpan.org/CPAN/authors/id/P/PL/PLICEASE/Test-Script-1.12.tar.gz')
md5sums=('e21bdeb91fa2bbb596a0c552f5fcc541')
sha512sums=('224e97ce8a1dc2510fc526fbe80384f08a07399b23bb89f485af7568777af26fbc921ed00fb6c665a4d9c2e50414db9a41b88286ec8b3473abfec47853c20cb3')
_distdir="Test-Script-1.12"

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
