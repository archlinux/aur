# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-io-aio'
pkgver='4.71'
pkgrel='1'
pkgdesc="Asynchronous/Advanced Input/Output"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.28' 'perl-common-sense>=0')
makedepends=()
url='https://metacpan.org/release/IO-AIO'
source=('http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/IO-AIO-4.71.tar.gz')
md5sums=('b748e01f409d7b5849000c181205f4c2')
sha512sums=('5f5a3acc328035da587fe359ee08e5820ab4de0d950d318ee056be7dbb0fe5665649d4a5416108329e3c6d3908df5dc0320ec094537d9380ecf0a992614710fb')
_distdir="IO-AIO-4.71"

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
