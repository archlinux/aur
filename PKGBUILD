# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-template-tiny'
pkgver='1.16'
pkgrel='1'
pkgdesc="Template Toolkit reimplemented in as little code as possible"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Template-Tiny'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Template-Tiny-1.16.tar.gz')
md5sums=('b6cf90da16bf5d05e54da88f09959101')
sha512sums=('490c136eace71e8c2462500c08a69554ba77310b5106b1af954820a30acd3df2104d9630e381bb0da00bb19ec3a77064185ada44330ef308650ddeb26f1b931b')
_distdir="Template-Tiny-1.16"

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
