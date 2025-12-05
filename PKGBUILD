# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-file-pathlist'
pkgver='1.04'
pkgrel='3'
pkgdesc="Find a file within a set of paths (like @INC or Java classpaths)"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-params-util>=0.24' 'perl>=5.005')
makedepends=()
url='https://metacpan.org/release/File-PathList'
source=("http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/File-PathList-$pkgver.tar.gz")
md5sums=('4559e3b29a04471ea3d36a5779d3b70a')
sha512sums=('6b462a0ce9b04bc74c6bdd6603b88177e57b24b5221c18aa6e6d83dd3de516734131dd90cc81e67f783dae45fbfa0f6e0896a2752aff3a9ddbc792e491328f81')
_distdir="File-PathList-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=".:inc"                 \
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
