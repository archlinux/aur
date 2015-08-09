# Contributor: GPP <gergan@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-catalyst-authentication-credential-http'
pkgver='1.016'
pkgrel='1'
pkgdesc="HTTP Basic and Digest authentication"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-plugin-authentication>=0.10005' 'perl-catalyst-runtime>=0' 'perl-class-accessor>=0' 'perl-data-uuid>=0.11' 'perl-string-escape>=0' 'perl-uri>=0')
makedepends=()
checkdepends=('perl-test-exception>=0' 'perl-test-mockobject>=0')
url='https://metacpan.org/release/Catalyst-Authentication-Credential-HTTP'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/Catalyst-Authentication-Credential-HTTP-1.016.tar.gz')
md5sums=('65b5f09e7e3e46370b67b39922760b8e')
sha512sums=('76285e217ecc9ec05f09451209a04843851d7c125e784408e55a0a671886f2bdec9ab36c528ded07d26c28ea389a58b6d24915530f08dd40687c83fd2a4c4509')
_distdir="Catalyst-Authentication-Credential-HTTP-1.016"

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
