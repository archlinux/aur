# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-compression-util'
pkgver='0.18'
pkgrel='1'
pkgdesc="Compression::Util - implementation of various techniques used in data compression"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.36.0')
makedepends=()
url='https://metacpan.org/release/Compression-Util'
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/Compression-Util-${pkgver}.tar.gz")
b2sums=('23c5977620896274bc6ef6017e81b8742210e608c1d1e811c177aa61657f013cf6424509cb6594ed9f40411ba9d57f24fb7630c53e368095fc2617472d814611')
_distdir="Compression-Util-${pkgver}"

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
