# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-text-asciitable'
pkgver='0.22'
pkgrel='1'
pkgdesc="Text::ASCIITable - create a nice formatted table using ASCII characters."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.0')
makedepends=()
url='https://metacpan.org/release/Text-ASCIITable'
source=("https://cpan.metacpan.org/authors/id/L/LU/LUNATIC/Text-ASCIITable-$pkgver.tar.gz")
md5sums=('6c34e6ed4575d59e8a51cbd4341e85f2')
sha512sums=('cdf550b84c1dbe2b39aa59945a53964237444e55ad64af26d736c4a3525bb037dbf4fb38f380cd9d6477cb8f98017a1e57668ca63139137d58d0ed45287e4bf9')
_distdir="Text-ASCIITable-$pkgver"

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
  rm -r "$pkgdir"/usr/lib
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
