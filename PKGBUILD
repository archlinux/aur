# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-net-github'
pkgver='0.74'
pkgrel='1'
pkgdesc="Perl Interface for github.com"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-message' 'perl-json-maybexs' 'perl-lwp-protocol-https' 'perl-moo' 'perl-type-tiny' 'perl-uri' 'perl-libwww')
makedepends=()
url='http://search.mcpan.org/dist/Net-GitHub'
source=('http://search.mcpan.org/CPAN/authors/id/F/FA/FAYLAND/Net-GitHub-0.74.tar.gz')
md5sums=('4e8453c00984911f83fbf381e22694ce')
sha512sums=('7ed6a5a17bb02249662078f51fb1fe690105ba5901844033b041d10d30f01ca4a22ca5d0b2c9e735825dd1d80c57eeddce1d0044920e13af4f9d7dc26b316511')
_distdir="Net-GitHub-0.74"

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
