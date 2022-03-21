# Contributor: Ordoban (dirk.langer@vvovgonik.de)
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-critic-policy-variables-prohibitunusedvarsstricter'
pkgver='0.114'
pkgrel='1'
pkgdesc="Don't ask for storage you don't need."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-ppi>=0' 'perl-ppix-quotelike>=0.011' 'perl-ppix-regexp>=0.071' 'perl-perl-critic>=0' 'perl-readonly>=0' 'perl>=5.6.1')
makedepends=()
url='https://metacpan.org/release/Perl-Critic-Policy-Variables-ProhibitUnusedVarsStricter'
source=("https://cpan.metacpan.org/authors/id/W/WY/WYANT/Perl-Critic-Policy-Variables-ProhibitUnusedVarsStricter-$pkgver.tar.gz")
md5sums=('dda3ad543f2808e4034f52fa2760bf03')
sha512sums=('21f73cb813417f59817c7e95d34783b69dd2f0a60f526daa0b19812799e388ee19dd1b16616f426b509cc051dcf0bb35b4de7140e0ce575c3baf3a129e72eb16')
_distdir="Perl-Critic-Policy-Variables-ProhibitUnusedVarsStricter-$pkgver"

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
