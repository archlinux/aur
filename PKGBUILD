# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-hide'
pkgver='0.0015'
pkgrel='2'
pkgdesc="Forces the unavailability of specified Perl modules (for testing)"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl>=5.6.1')
makedepends=()
url='https://metacpan.org/release/Devel-Hide'
source=("http://search.cpan.org/CPAN/authors/id/D/DC/DCANTRELL/Devel-Hide-${pkgver}.tar.gz")
md5sums=('7f11107163e259754c3f7dc7c2cf6d91')
sha512sums=('6fbd73e21630596c2c398ba2490be4f17b95de5c25af547f3a824cebb87ed57d99cba418ba6caefbb8494f3341c571da5debae13add6b698c9e6ba4e001f60d7')
_distdir="Devel-Hide-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
