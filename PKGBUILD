# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-term-size-perl'
pkgver='0.031'
pkgrel='2'
pkgdesc="Perl extension for retrieving terminal size (Perl version)"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Term-Size-Perl'
source=("http://search.cpan.org/CPAN/authors/id/F/FE/FERREIRA/Term-Size-Perl-${pkgver}.tar.gz")
md5sums=('50779c7af28dd5bfb02e541c6e0173ea')
sha512sums=('7babfb7637e795f1826a964a64cdca48bc7d92dc2cdff0fbdf62f2462fcd2be81475703f577baa18ce3df24f6ae8c103ca19ea53aa3b78733391ed456fcb66bc')
_distdir="Term-Size-Perl-${pkgver}"

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
