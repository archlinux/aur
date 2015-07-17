# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-moosex-types-datetime'
pkgver='0.10'
pkgrel='1'
pkgdesc="DateTime related constraints and coercions for"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime>=0.4302' 'perl-datetime-locale>=0.40' 'perl-datetime-timezone>=0.95' 'perl-moose>=0.41' 'perl-moosex-types>=0.30' 'perl-test-use-ok>=0' 'perl-namespace-clean>=0.08')
makedepends=()
checkdepends=('perl-test-fatal>=0')
url='http://search.cpan.org/dist/MooseX-Types-DateTime'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Types-DateTime-0.10.tar.gz')
md5sums=('3f9a0b5c99949df997da1af47047c30d')
sha512sums=('16a30b8940dd60790ae26e5e628556520589f6a8abeadb95c184aa901aa48fe53e49c09395522cb1cc2d82b3eaf46fd61e0f0f7ccc823bfedf7e9c93016049f1')
_distdir="MooseX-Types-DateTime-0.10"

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
