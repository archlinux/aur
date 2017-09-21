# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-linux-desktopfiles'
pkgver='0.21'
pkgrel='1'
pkgdesc="A very fast Perl module for parsing the Linux desktop files."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.14.0')
makedepends=()
url='https://metacpan.org/release/Linux-DesktopFiles'
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/Linux-DesktopFiles-$pkgver.tar.gz")
md5sums=('975f12e4c136b246f18549667249e580')
sha512sums=('4544db01073824e3cac2c71fe11c1658cceed7481eb2cb73fb8009268ac9587ab083598f9e842f15242c0fa7c8403170ac1a58bd7b499688d4df3be037329a3a')
_distdir="Linux-DesktopFiles-${pkgver}"

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
