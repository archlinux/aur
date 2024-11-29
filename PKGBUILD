# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Contributor: Morgenstern <charles [at] charlesbwise [dot] com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mce'
pkgver='1.900'
pkgrel='1'
pkgdesc="Many-Core Engine for Perl providing parallel processing capabilities"
arch=('any')
license=('Artistic-1.0-Perl'
         'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/MCE'
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MARIOROY/MCE-${pkgver}.tar.gz")
md5sums=('a9f0aa69abf20ed35e808be8fb63e660')
sha512sums=('b9924275d478dfeffbf739744da19806cf6a51d5b9ee0038df02b39318cbf28cc026b8d05d0c9c6f0381ae93f39573a307f741f595bc1558c34bf2a7e35b5845')
_distdir="MCE-${pkgver}"

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
