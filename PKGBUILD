# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mongodb'
pkgver='1.2.3'
pkgrel='1'
pkgdesc="Official MongoDB Driver for Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.22' 'perl' 'perl-authen-scram' 'perl-boolean>=0.25' 'perl-class-xsaccessor' 'perl-datetime>=0.78' 'perl-json-maybexs' 'perl-moo>=2' 'perl-namespace-clean' 'perl-path-tiny>=0.054' 'perl-safe-isa' 'perl-tie-ixhash' 'perl-try-tiny' 'perl-type-tiny' 'perl-type-tiny-xs' 'perl-config-autoconf')
makedepends=()
checkdepends=('perl-test-deep>=0.111' 'perl-test-fatal')
url='https://metacpan.org/release/MongoDB'
source=('http://search.cpan.org/CPAN/authors/id/M/MO/MONGODB/MongoDB-v1.2.3.tar.gz')
md5sums=('3112816c4012f25049ad9faa1a267262')
sha512sums=('c79a272966a280158cef68a143a747821464afc7cb9ae31647492cf4c27782ffeab27cd7c51011c3e38a8c5fd0c5ebf3c55aa3569fc8d881225f1653314345fa')
_distdir="MongoDB-v1.2.3"

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
