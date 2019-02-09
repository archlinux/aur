# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-bytes-random-secure-tiny'
pkgver='1.008'
pkgrel='1'
pkgdesc="Bytes::Random::Secure::Tiny - a tiny Perl extension to generate cryptographically-secure random bytes."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.0')
makedepends=()
url='https://metacpan.org/release/Bytes-Random-Secure-Tiny'
source=("http://search.cpan.org/CPAN/authors/id/D/DA/DAVIDO/Bytes-Random-Secure-Tiny-$pkgver.tar.gz")
md5sums=('97ab84d97b5bee8666ff14d275a719a5')
sha512sums=('24a53916f17304abde11360bac4ad3a98283200e2e7e74fa744f3fe423c7849ba62af3867211939475ee8ce0158bc68e754ab2a41c46c861af636c171d38dbb5')
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
  rm -r "$pkgdir"/usr/lib
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
