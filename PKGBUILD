# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-parse-mime'
pkgver='1.006'
pkgrel='2'
pkgdesc="Parse mime-types, match against media ranges"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Parse-MIME'
source=("http://search.cpan.org/CPAN/authors/id/A/AR/ARISTOTLE/Parse-MIME-$pkgver.tar.gz")
md5sums=('fe7f0542006f17ffa39b11efb561d016')
sha512sums=('8646668c90649800afa2a4342d8a2993cbb9056aba426238d3b02fb5de4f344e5de4b63a871488dfca116f172ff6c906c20fa4374cb4b169f0f25c2fd92e931f')
_distdir="Parse-MIME-$pkgver"

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
