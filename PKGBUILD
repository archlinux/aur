# Contributor: Marc Cousin <cousinmarc@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-poe-component-syndicator'
pkgver='0.06'
pkgrel='1'
pkgdesc="A POE component base class which implements the Observer pattern"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-object-pluggable>=1.29' 'perl-poe>=1.311')
makedepends=()
url='https://metacpan.org/release/POE-Component-Syndicator'
source=('http://search.cpan.org/CPAN/authors/id/H/HI/HINRIK/POE-Component-Syndicator-0.06.tar.gz')
md5sums=('dfa8019122225d9853263293002ff29b')
sha512sums=('0a425cc36ed9bd19ed3c1d585e9ce694e90eec536e3efd4247d7eaf92712e835b96baceafc06007c0f9ff5fc0eaead4c627381e62bbee43e6c2e5ac44bf18f5a')
_distdir="POE-Component-Syndicator-0.06"

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
