# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-linux-desktopfiles'
pkgver='0.12'
pkgrel='1'
pkgdesc="Perl module for parsing the Linux .desktop files."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.14.0')
makedepends=()
url='https://metacpan.org/release/Linux-DesktopFiles'
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/Linux-DesktopFiles-$pkgver.tar.gz")
md5sums=('0f6f218fde88d99108d0f7de9cdff9db')
sha512sums=('1c1c1462d70a1d43c946e27ba52b5ca141bb4b2328da132b3a2cf59a7f2425e9179bb64ddf07d64eda65d64f803c10001504a61f0586d388410e5f2504cb02d0')
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
