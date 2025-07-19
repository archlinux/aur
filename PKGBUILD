# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-file-sharedir-tiny'
pkgver='0.001'
pkgrel='2'
pkgdesc="Locate per-dist and per-module shared files"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/File-ShareDir-Tiny'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/File-ShareDir-Tiny-$pkgver.tar.gz")
md5sums=('00ca365e0120bf22764ea6dc8ed646f9')
sha512sums=('0e9a58d60a9135d35b6edefcbb54335329837a6f4bd1f3666e7a86ba5a2e683d9091759aabcfcf56ccb8fd423391e2d56d1d47daffd4ffd10253ddadee4b525b')
_distdir="File-ShareDir-Tiny-$pkgver"

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
