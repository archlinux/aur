# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-pod-minimumversion'
pkgver='50'
pkgrel='1'
pkgdesc="Determine minimum Perl version of POD directives."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-string>=1.02' 'perl-pod-parser>=0' 'perl>=5.004')
makedepends=()
url='https://metacpan.org/release/Pod-MinimumVersion'
source=('http://search.cpan.org/CPAN/authors/id/K/KR/KRYDE/Pod-MinimumVersion-50.tar.gz')
md5sums=('23fb6595e73c25eaafe3717a3811e274')
sha512sums=('abfbde62183a767a8ad036986fcbadfde2053ab326c383739504e4da55da1108f4b554c495b938866901e5ccdb1f19b55c1d5c04932c1913b37a17564ab16f10')
_distdir="Pod-MinimumVersion-50"

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
