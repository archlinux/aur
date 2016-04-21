# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-moosex-types-datetime'
pkgver='0.13'
pkgrel='1'
pkgdesc="DateTime related constraints and coercions for"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime>=0.4302' 'perl-datetime-locale>=0.40' 'perl-datetime-timezone>=0.95' 'perl-moose>=0.41' 'perl-moosex-types>=0.30' 'perl-test-use-ok>=0' 'perl-namespace-clean>=0.08')
makedepends=()
checkdepends=('perl-test-fatal>=0')
url='http://search.cpan.org/dist/MooseX-Types-DateTime'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Types-DateTime-$pkgver.tar.gz")
md5sums=('c4ba197decb5b6a2e45120a4a987e25d')
sha512sums=('aadd07960d4d20ed5926ea6e14650bf2162a73e40e3e26797ad0323a083c1796f7d623b895e3a612da89315387082a9835380ff2ed7d74455a2074c818533dc5')
_distdir="MooseX-Types-DateTime-$pkgver"

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
