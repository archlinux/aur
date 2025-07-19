# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-regexp-util'
pkgver='0.005'
pkgrel='2'
pkgdesc="A selection of general-utility regexp subroutines"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-exporter-tiny>=0' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/Regexp-Util'
source=("http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/Regexp-Util-$pkgver.tar.gz")
md5sums=('8fd3e4adabcfe44b5c3fba28b1d10168')
sha512sums=('83e40a14fa75a4d809af4f39087154332a85cafd144350982b0481f338c598bdccf8c930accf29327246251702239782c58333a54de1a92742999a2b45a19ca1')
_distdir="Regexp-Util-$pkgver"

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
