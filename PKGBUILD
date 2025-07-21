# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-http'
pkgver='0.22'
pkgrel='2'
pkgdesc="Test HTTP interactions."
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-class-field>=0' 'perl-libwww>=0')
makedepends=()
url='https://metacpan.org/release/Test-HTTP'
source=("http://search.cpan.org/CPAN/authors/id/M/MM/MML/Test-HTTP/Test-HTTP-$pkgver.tar.gz")
md5sums=('a3e3b2e296a2fe1bdff2f0854f632fd9')
sha512sums=('8f1e7c74bf240c54ff9f99a388ef6bddf70f6b9604616453f262f6788462d7a90e186b4661c592ca76394b1364f3ca9806a4bfbc5dc6175f957eee26106a30ca')
_distdir="Test-HTTP-$pkgver"

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
