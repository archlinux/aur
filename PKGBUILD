# Contributor: lionel@les-miquelots.net
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-crypt-argon2'
pkgver='0.032'
pkgrel='1'
pkgdesc="Perl interface to the Argon2 key derivation functions"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=('perl-dist-build>=0.028')
url='https://metacpan.org/release/Crypt-Argon2'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Crypt-Argon2-$pkgver.tar.gz")
md5sums=('2cb6b9914e20edd6dc1179fc76e32a4a')
sha512sums=('af893bb26d1b6d913e4afe6ec78420867aaeeeff3e05a7e6b5613ce3e22dc90d54c54aa87c1016dc29d16240f33cda3e364212ed142ab4aaa8c9dfc43de874e6')
_distdir="Crypt-Argon2-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  PERL5LIB="" /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
