# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mousex-types-path-class'
pkgver='0.07'
pkgrel='6'
pkgdesc="A Path::Class type library for Mouse"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-mouse>=0.39' 'perl-mousex-types>=0.02' 'perl-path-class>=0' 'perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-useallmodules>=0')
url='https://metacpan.org/release/MouseX-Types-Path-Class'
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MASAKI/MouseX-Types-Path-Class-$pkgver.tar.gz")
md5sums=('49c15495a78e0b5ad9146b9c632969bd')
sha512sums=('07593ec3c20f1b817c8881f6569ff4ad21e7cf1deeed34f790cd64027c956e1a501ec325e4296c3af480643f5d386c074c2810cf14236f8b6ab389d2e5a241d8')
_distdir="MouseX-Types-Path-Class-$pkgver"

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
