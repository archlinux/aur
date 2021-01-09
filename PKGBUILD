# Contributor: Dirk Langer <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-bundle-camelcade'
pkgver='0.001'
pkgrel='1'
pkgdesc="Bundle of modules used by Perl5 plugin for IntelliJ IDEs"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-app-prove-plugin-passenv>=0' 'perl-app-cpanminus>=0' 'perl-devel-camelcadedb>=0' 'perl-devel-cover>=0' 'perl-devel-nytprof>=0' 'perl-json>=0' 'perl-perl-critic>=0' 'perl-tidy>=0' 'perl-tap-formatter-camelcade>=0')
makedepends=()
url='https://metacpan.org/release/Bundle-Camelcade'
source=('http://search.cpan.org/CPAN/authors/id/H/HU/HURRICUP/Bundle-Camelcade-0.001.tar.gz')
md5sums=('f288ee2ac0db9a4c179deb88c723c171')
sha512sums=('92ec0a66809ecc866191b773a2414bcf4c27c5c7eb9fff512e5701c5ed511ad7e5500a2a346eb4d1407f265160cb0915de2c4ef627663cc82c475400778804f0')
_distdir="Bundle-Camelcade-0.001"

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

