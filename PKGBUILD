# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-jenkins-api'
pkgver='0.11'
pkgrel='1'
pkgdesc="A wrapper around the Jenkins API"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-sharedir' 'perl-json' 'perl-moo' 'perl-rest-client' 'perl-type-tiny' 'perl-uri')
makedepends=()
checkdepends=('perl-test-most')
url='https://metacpan.org/release/Jenkins-API'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEWELLC/Jenkins-API-0.11.tar.gz')
md5sums=('92fe55550ea2631acc2c855a53a6515d')
sha512sums=('9064eb5dfb5143ccda1efa8d873c25af16fb23fc66bb5aec9c99487537e0baf4dc3006f4e595e9d69f57b7d9ec1e30c2264a7e8cd0fb9c81fdc0f49b4366a772')
_distdir="Jenkins-API-0.11"

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
