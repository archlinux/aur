# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-algorithm-c3'
pkgver='0.10'
pkgrel='1'
pkgdesc="A module for merging hierarchies using the C3 algorithm"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Algorithm-C3'
source=('http://search.cpan.org/CPAN/authors/id/H/HA/HAARG/Algorithm-C3-0.10.tar.gz')
md5sums=('48162c8974b3056c1315203efc7d8748')
sha512sums=('2ace81679e8ff2f3f3fbe8028741aef0833b1415a7cde0d1b20c90557889347685d1135029cd849324b6d40c435a80b228549bf669bbf43f9a1b2ed7075b605e')
_distdir="Algorithm-C3-0.10"

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
