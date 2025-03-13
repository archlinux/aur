# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-data-binary'
pkgver='0.01'
pkgrel='2'
pkgdesc="Simple detection of binary versus text in strings"
arch=('any')
license=('Artistic-2.0')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Data-Binary'
source=("http://search.cpan.org/CPAN/authors/id/S/SN/SNKWATT/Data-Binary-${pkgver}.tar.gz")
md5sums=('5828c669bb55ccae83aa6dc26f2316fb')
sha512sums=('fee212031713280218ad01aba596bb6827ee10c2cc258f18ddf02b2e5e3b5dbf40f80d8ad92f29e5acb390656fd1c7d752e783401842b45cb75ddd9ff6fd975d')
_distdir="Data-Binary-${pkgver}"

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
