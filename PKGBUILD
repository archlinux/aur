# Maintainer: Zack Emmert <zemmert@fastmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-expect'
pkgver='1.38'
pkgrel='1'
pkgdesc="automate interactions with command line programs that expose a text terminal interface."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-tty>=1.11' 'perl>=5.6.0')
makedepends=()
url='https://metacpan.org/release/Expect'
source=("http://search.cpan.org/CPAN/authors/id/J/JA/JACOBY/Expect-${pkgver}.tar.gz")
md5sums=('0b3e2b619a46f9c16aa7d9ff457ee37f')
sha512sums=('8dfaad3d471c848091696f9ab465b6ee6ffe16501bd0f4980f2a56df0fe7a12bdc62c47145b7c60c9a7ac90b56b7417bd20b695cea8e383f4da069a4f00ddd98')
_distdir="Expect-${pkgver}"

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
