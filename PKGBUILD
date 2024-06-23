# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-parse-pmfile'
pkgver='0.47'
pkgrel='1'
pkgdesc="parses .pm file as PAUSE does"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=('perl-extutils-makemaker-cpanfile>=0.09')
url='https://metacpan.org/release/Parse-PMFile'
source=('http://search.cpan.org/CPAN/authors/id/I/IS/ISHIGAKI/Parse-PMFile-0.47.tar.gz')
md5sums=('d8c08a5af7456c8bc7bbfbc4ea14591d')
sha512sums=('a273c1e52d1f4e6249af2af9a1d96b5d97424a934efcf1d9da5ccaea86a519714b148f172b764503911a380603522745ccc1c59f9d37122b053d692a68e3cf43')
_distdir="Parse-PMFile-0.47"

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
