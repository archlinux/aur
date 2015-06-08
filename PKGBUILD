# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-http-server-brick'
pkgver='0.1.4'
pkgrel='1'
pkgdesc="Simple pure perl http/https server for prototyping \"in the style of\" Ruby's WEBrick"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-http-daemon' 'perl-http-message' 'perl-libwww' 'perl-lwp-mediatypes')
makedepends=()
url='http://search.cpan.org/dist/HTTP-Server-Brick'
source=('http://search.cpan.org/CPAN/authors/id/A/AU/AUFFLICK/HTTP-Server-Brick-0.1.4.tar.gz')
md5sums=('35f5a44337fbda93bf28d91e993227af')
sha512sums=('d050370c886222e3cb91b2e3c506b7f7bc1027f041e02b50443a15945010f04654e21ae8fe3fe6b6f5973607e3a4ac0caefd5bf91c21a6ff67e364078660c806')
_distdir="HTTP-Server-Brick-0.1.4"

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
