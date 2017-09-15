# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-linux-desktopfiles'
pkgver='0.20'
pkgrel='1'
pkgdesc="A very fast Perl module for parsing the Linux desktop files."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.14.0')
makedepends=()
url='https://metacpan.org/release/Linux-DesktopFiles'
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/Linux-DesktopFiles-$pkgver.tar.gz")
md5sums=('9f37545c56d651dd671910df5856a260')
sha512sums=('bf3dad61d56d318bb12197ea2ae5ab0806988483fa14e654c111a7e80240795063a1b6e4b4ccfc0c20f3ca0bd0241b5ae54815dff4a1175db2b64c666661ea3a')
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
