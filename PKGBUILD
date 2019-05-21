# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-env'
pkgver='1.084'
pkgrel='1'
pkgdesc="test the environment"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008')
makedepends=()
url='https://metacpan.org/release/Test-Env'
source=('http://search.cpan.org/CPAN/authors/id/B/BD/BDFOY/Test-Env-1.084.tar.gz')
md5sums=('7c08ea653ba3652ba3559be00e70f535')
sha512sums=('06a3ed9ac82defe85c411543864ab5cee2891f4f3847cc4bcc3b5c257b722668d9a6f35335db34da1a3766d51a01aa15636051e9d6401171211e10a94236fb4e')
_distdir="Test-Env-1.084"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
