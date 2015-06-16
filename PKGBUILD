# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-test-compile'
pkgver='1.2.1'
pkgrel='1'
pkgdesc="Check whether Perl files compile correctly."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-universal-require')
makedepends=()
url='https://metacpan.org/release/Test-Compile'
source=('http://search.cpan.org/CPAN/authors/id/E/EG/EGILES/Test-Compile-v1.2.1.tar.gz')
md5sums=('f93c3ec04034a42c21ffdc2d72b09200')
sha512sums=('ebc11e6209e89676900d847b312252fc9915576da08ac4c9c2c73cc446e8c5007c1cdc71f0b1e3b19980a9ec2b7b9190c2d823b8510a6e2f45e798b89a979b73')
_distdir="Test-Compile-v1.2.1"

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
