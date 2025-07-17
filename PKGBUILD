# Contributor: lionel@les-miquelots.net
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-crypt-argon2'
pkgver='0.030'
pkgrel='20'
pkgdesc="Perl interface to the Argon2 key derivation functions"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=('perl-dist-build>=0.020')
url='https://metacpan.org/release/Crypt-Argon2'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Crypt-Argon2-$pkgver.tar.gz")
md5sums=('73388e0f40f37d4ca0328b627eb12d03')
sha512sums=('81231f7ebeee627c79dd89947f603c55892ec2ae4579d2eeb7c58011cbc2b61c87d8f030cc235fcccf60c48291dc06ed0786d40b3710f08abb34cefc0969e0b3')
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
