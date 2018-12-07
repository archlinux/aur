# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator : CPANPLUS::Dist::Arch 1.32

pkgname='perl-linux-desktopfiles'
pkgver='0.25'
pkgrel='2'
pkgdesc="Linux::DesktopFiles - a very fast Perl module for parsing the Linux desktop files."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.14.0')
makedepends=()
url='https://metacpan.org/release/Linux-DesktopFiles'
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/Linux-DesktopFiles-$pkgver.tar.gz")
md5sums=('ec72ae0a0c4f8fc4d242f836d26c99e6')
sha512sums=('a825b014e85e53cf0a142c7d239948f288930627a517444d21a81b8ee898ab3bc1b7dc8864df7b76b2f3a982280ffcb09325f492d0d83950c682110999d5e107')
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

  rm -r "$pkgdir/usr/lib"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
