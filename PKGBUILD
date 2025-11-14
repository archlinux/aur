# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-overloadinfo'
pkgver='0.008'
pkgrel='1'
pkgdesc="introspect overloaded operators"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-mro-compat>=0' 'perl-package-stash>=0.14' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-fatal>=0')
url='https://metacpan.org/release/Devel-OverloadInfo'
source=("http://search.cpan.org/CPAN/authors/id/I/IL/ILMARI/Devel-OverloadInfo-$pkgver.tar.gz")
md5sums=('3b176b43f7245017615b79c08bb1bf66')
sha512sums=('1c614e1132c8c763ccac79ea3c80c08636d617af55bdcba4cc52aa06c9cefca07fd4f1921e54f5dc76b140ed8546da917602eab81f59efd6c490f23b8b8abe41')
_distdir="Devel-OverloadInfo-$pkgver"

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
