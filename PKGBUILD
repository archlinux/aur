# CPAN Name  : IO-Compress-Lzma
# Contributor: Asger Hautop Drewsen <asgerdrewsen@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-io-compress-lzma'
pkgver='2.081'
pkgrel='1'
pkgdesc="Write lzma files/buffers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-compress-raw-lzma>=2.081' 'perl-io-compress>=0')
makedepends=()
url='https://metacpan.org/release/IO-Compress-Lzma'
source=('http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/IO-Compress-Lzma-2.081.tar.gz')
md5sums=('786b030295939beac0fdb837d14fb403')
sha512sums=('269c1c22a8fd5e50b2bdaf87b714fd83d9a7caa0c66df6ba522aaf8566e98a7b43201ef2bc441e9eb27d8dedec654ff44ad16e5a69b3d050ca750261be868469')
_distdir="IO-Compress-Lzma-2.081"

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
