# Contributor: nous@artixlinux.org
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-http-proxyselector'
pkgver='0.02'
pkgrel='1'
pkgdesc="Perl extension for automatically setting an anonymous proxy"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/HTTP-ProxySelector'
source=('http://search.cpan.org/CPAN/authors/id/U/UD/UDASSIN/HTTP-ProxySelector-0.02.tar.gz')
md5sums=('d03852c06c7f7b17c48b1c3c6b687e4f')
sha512sums=('aca9a1c3e5001c7e2d88d2996085c9357ad7302842907daa6e33cc50a6e15d4bbab44ae517b1fb6a0fbbdb126caba5bb1d1d8c80bb67d61c5d236c5c53bcf55b')
_distdir="HTTP-ProxySelector-0.02"

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
