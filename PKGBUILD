# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-url-encode'
pkgver='0.03'
pkgrel='1'
pkgdesc="Encoding and decoding of C<application/x-www-form-urlencoded> encoding."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/URL-Encode'
source=('http://search.cpan.org/CPAN/authors/id/C/CH/CHANSEN/URL-Encode-0.03.tar.gz')
md5sums=('3501ba92bbd23bb230959a5c9a22ca12')
sha512sums=('1f47b9ca9470f0f51f4b3e806f32ef0044d10ab2723944ba93eb740278155fcb77471208b833f7d77ff829cc5879211f592a3ae6ba3ccd6a4ee38d866bb38197')
_distdir="URL-Encode-0.03"

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
