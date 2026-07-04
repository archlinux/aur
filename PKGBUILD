# Contributor: lionel@les-miquelots.net
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-crypt-argon2'
pkgver='0.031'
pkgrel='1'
pkgdesc="Perl interface to the Argon2 key derivation functions"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=('perl-dist-build>=0.028')
url='https://metacpan.org/release/Crypt-Argon2'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Crypt-Argon2-$pkgver.tar.gz")
md5sums=('f6ca6607bfa8de1541c9bea22c05e8e0')
sha512sums=('77bede32a0c39bcb38797c9eea34b92947a3f855719c94c90f79dfb9287a43ffb35f4b6644e42eef60f1d94932160fe1c56028103f056558e50edc8765427913')
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
