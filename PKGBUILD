# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-log-dispatch'
pkgver='2.44'
pkgrel='1'
pkgdesc="Dispatches messages to one or more outputs"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-devel-globaldestruction' 'perl-dist-checkconflicts>=0.02' 'perl-module-runtime' 'perl-params-validate>=0.15')
makedepends=()
checkdepends=('perl-test-fatal' 'perl-test-requires')
url='https://metacpan.org/release/Log-Dispatch'
source=('http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Log-Dispatch-2.44.tar.gz')
md5sums=('a08ad454f77ee6fe0d98e32516b835f2')
sha512sums=('2acaf327a440e00ba33e60da50db4c49b7ff8884ffc5dea0c033045367d1ab4cfb69ca81a2a08741ba80b347fd22238791bd758c37754154a5afa6311fa5a083')
_distdir="Log-Dispatch-2.44"

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
