# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-digest-whirlpool'
pkgver='2.04'
pkgrel='1'
pkgdesc="A 512-bit, collision-resistant, one-way hash function"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Digest-Whirlpool'
source=('http://search.cpan.org/CPAN/authors/id/A/AV/AVAR/Digest-Whirlpool-2.04.tar.gz')
md5sums=('b3f1c042e2ab3226a71cc51a07b3f66a')
sha512sums=('c9b7e372446fd45a0aff4a439e89032c789ea224eada777bd8457c63b884c4d39379f8070130d01cf9239f771ff1bf039e2ce1adfac7fce413222f206b4a10d4')
_distdir="Digest-Whirlpool-2.04"

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
