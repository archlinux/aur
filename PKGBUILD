# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moosex-attributehelpers'
pkgver='0.25'
pkgrel='1'
pkgdesc="(DEPRECATED) Extend your attribute interfaces"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.56' 'perl>=5.006')
makedepends=()
checkdepends=('perl-moose' 'perl-test-exception>=0.21')
url='https://metacpan.org/release/MooseX-AttributeHelpers'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-AttributeHelpers-0.25.tar.gz')
md5sums=('31552c620d3852650b8d3c9c914c29fd')
sha512sums=('76f15c7f7bf0665464d33f1d432ec59b9d48a4cdc8b8af792c24c715dac9debef68ba4967a090f9960647f11e5d2ae0ba43e83eeba1cbc4a446a442dbdd57e1e')
_distdir="MooseX-AttributeHelpers-0.25"

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
