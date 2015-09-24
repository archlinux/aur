# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-net-github'
pkgver='0.78'
pkgrel='1'
pkgdesc="Perl Interface for github.com"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-message' 'perl-json-maybexs' 'perl-lwp-protocol-https' 'perl-moo' 'perl-type-tiny' 'perl-uri' 'perl-libwww')
makedepends=()
url='https://metacpan.org/release/Net-GitHub'
source=('http://search.cpan.org/CPAN/authors/id/F/FA/FAYLAND/Net-GitHub-0.78.tar.gz')
md5sums=('5ef625454f5690e4793502e64c957fae')
sha512sums=('106d1ff17bf6cd37f1ed20bc6e9db0c07590e467e2fb1a2bf4d7d8d4f0d358158b8a6da241769e8163cdfaeade02d5c3a218d77ea5ded3a19656f79056ed531e')
_distdir="Net-GitHub-0.78"

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
