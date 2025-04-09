# Contributor: lionel@les-miquelots.net
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-crypt-argon2'
pkgver='0.029'
pkgrel='17'
pkgdesc="Perl interface to the Argon2 key derivation functions"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=('cpanminus')
url='https://metacpan.org/release/Crypt-Argon2'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Crypt-Argon2-0.029.tar.gz')
md5sums=('5ad0b523ab32ae0b343d779b479d2604')
sha512sums=('dc83d9267de56f5dc48fcab8ace1b3ac15850f4e179ee9e2745c2f8359ea378b2a8058f8557637ee1415463073402e4ec37967f6776a3efcb59bb0adad014df5')
_distdir="Crypt-Argon2-0.029"

build() {
  cpanm -n -S Dist::Build@0.010
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
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
