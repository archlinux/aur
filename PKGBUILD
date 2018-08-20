# Maintainer: Zack Emmert <zemmert@fastmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-expect'
pkgver='1.35'
pkgrel='1'
pkgdesc="automate interactions with command line programs that expose a text terminal interface."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-tty' 'perl>=5.6.0')
makedepends=()
url='https://metacpan.org/release/Expect'
source=("http://search.cpan.org/CPAN/authors/id/J/JA/JACOBY/Expect-${pkgver}.tar.gz")
md5sums=('f7170964058cfb4a73567284a64c8cee')
sha512sums=('97ff1969323cf0bcdecc792199111e273e1a4c032a9cdecac1acb521a280e772256c1a8c5433b4da1f34a585d83608522e9f00cf3c5a0a30211662a5373ef0b7')
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
