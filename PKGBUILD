# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-net-tomcat'
pkgver='0.02'
pkgrel='1'
pkgdesc="A Perl API for monitoring Apache Tomcat."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-libwww')
makedepends=()
url='https://metacpan.org/release/Net-Tomcat'
source=('http://search.cpan.org/CPAN/authors/id/L/LT/LTP/Net-Tomcat-0.02.tar.gz')
md5sums=('5f7d6fe6b5f514ebf59d5446424a009b')
sha512sums=('6eaf11e6404fc8b376a11ca76c918db079ea2e1b5237f764ae4ede30392e66dbb4036c1329bdfb3b470edcd2dd8e6a7673fd15a790a8d0a96a2683997d41b81d')
_distdir="Net-Tomcat-0.02"

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
