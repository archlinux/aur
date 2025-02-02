# Maintainer : int <int [ate] arcor [dot] de>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-crypt-eksblowfish'
pkgver='0.009'
pkgrel='3'
pkgdesc="Perl/CPAN Module Crypt::Eksblowfish: the Eksblowfish block cipher"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006' 'perl-class-mix>=0.001' 'perl-module-build')
makedepends=()
url='https://metacpan.org/release/Crypt-Eksblowfish'
source=("http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/Crypt-Eksblowfish-$pkgver.tar.gz")
md5sums=('d2907b00cc500fc523bf86bb427d9bb8')
sha512sums=('ca66a1ca4fd71388f25dc77c943e2416ed8534576309dd75f19a7219457418140c1bd21887d61918c34d3d6f9e11ea822b4661d30c6edf7f3673bbcd9a00a51b')
_distdir="Crypt-Eksblowfish-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
