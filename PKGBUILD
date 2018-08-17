# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-pod-spell'
pkgver='1.20'
pkgrel='1'
pkgdesc="a formatter for spellchecking Pod"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-tiny' 'perl-file-sharedir-projectdistdir>=1.000' 'perl-lingua-en-inflect' 'perl-file-sharedir-install')
makedepends=()
checkdepends=('perl-test-deep')
url='https://metacpan.org/release/Pod-Spell'
source=('https://cpan.metacpan.org/authors/id/D/DO/DOLMEN/Pod-Spell-1.20.tar.gz')
md5sums=('5e4d4c2b74e3cb780c5531cb8bfb04d4')
sha512sums=('9a676a897dae7dfe37e9bfca2e5c11bcdc3221ed532b79970e6cc4d0de8dec0eca754cb9fbc5cbbbf6533a213c284d691609dd86d246ae146187bd9cd37d292e')
_distdir="Pod-Spell-1.20"

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
