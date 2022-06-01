# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-asa'
pkgver='1.04'
pkgrel='4'
pkgdesc="Lets your class/object say it works like something else"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
url='https://metacpan.org/release/asa'
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/asa-$pkgver.tar.gz")
md5sums=('cbe6d1db505eb4eaa2bf35a637fc0451')
sha512sums=('8584036c1c520741fe1bd4fb2875a86a46e2abd07d441078ef64bd90a31ba13b001079b020263add298ff004e094f8380b2ec590aacfc808cc1ba4be6b177b0a')
_distdir="asa-$pkgver"

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
