# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-moosex-setonce'
pkgver='0.200002'
pkgrel='1'
pkgdesc="write-once, read-many attributes for Moose"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose')
makedepends=()
checkdepends=('perl-test-fatal')
url='https://metacpan.org/release/MooseX-SetOnce'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/MooseX-SetOnce-0.200002.tar.gz')
md5sums=('1e6d9e3b39d9f3241a2d878b4eb97c82')
sha512sums=('7783496c0d9c82793bd730894ffb8e640caa199fc1b320c9007fc482eaf123c415914780801b9907fc6d1fd460d47fbb38824b75ae1dce6130f7f80a248b2166')
_distdir="MooseX-SetOnce-0.200002"

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
