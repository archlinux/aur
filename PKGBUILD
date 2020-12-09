# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-bytes-random-secure-tiny'
pkgver='1.011'
pkgrel='1'
pkgdesc="Bytes::Random::Secure::Tiny - a tiny Perl extension to generate cryptographically-secure random bytes."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.0')
makedepends=()
url='https://metacpan.org/release/Bytes-Random-Secure-Tiny'
source=("http://search.cpan.org/CPAN/authors/id/D/DA/DAVIDO/Bytes-Random-Secure-Tiny-$pkgver.tar.gz")
md5sums=('e8ef537ed481669444358c612cfcc678')
sha512sums=('b04b765af3d4ecd337571b53ff02d9efc54a08a598ece5df82357c8e364fbeff0f2a97561916a0e362f5e89e83939cdd10c3a3b3288e2952324fa57490d640be')
_distdir="Bytes-Random-Secure-Tiny-$pkgver"

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
