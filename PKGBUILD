# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-locale-textdomain-utf8'
pkgver='0.020'
pkgrel='2'
pkgdesc="Shortcut to use Locale::TextDomain and decoding to UTF8"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-libintl-perl>=0')
makedepends=()
url='https://metacpan.org/release/Locale-TextDomain-UTF8'
source=("http://search.cpan.org/CPAN/authors/id/P/PE/PERLANCAR/Locale-TextDomain-UTF8-$pkgver.tar.gz")
md5sums=('8558d3e96630cd39eb68d0508565c78a')
sha512sums=('572bb907d1261175ec921a407dc4caa420d09f794748e8fddc0bce4d3a58ffeac0097c6976583aedb6196697b16c159f8221d9f61b827e58a106f269088d39b5')
_distdir="Locale-TextDomain-UTF8-$pkgver"

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
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
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
