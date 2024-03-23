# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dbix-class-cursor-cached'
pkgver='1.001004'
pkgrel='1'
pkgdesc="cursor class with built-in caching support"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-carp-clan>=6.0' 'perl-dbix-class>=0.08124' 'perl>=5.8.1')
makedepends=('perl-cache-cache>=0' 'perl-dbd-sqlite>=1.25')
url='https://metacpan.org/release/DBIx-Class-Cursor-Cached'
source=('http://search.cpan.org/CPAN/authors/id/A/AR/ARCANEZ/DBIx-Class-Cursor-Cached-1.001004.tar.gz')
md5sums=('117dcd7e06c2456379092226dff873d3')
sha512sums=('e20f950d505615987444f724615e49929b180af4c837542b163506a89675f4747c182060472d80a8f2bf265d44c719c560e0856176a95fb8c229568e996621b1')
_distdir="DBIx-Class-Cursor-Cached-1.001004"

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
