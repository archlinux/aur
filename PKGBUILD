# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Contributor: Dirk Langer AKA Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-devel-overloadinfo'
_realname='Devel-OverloadInfo'
pkgver='0.005'
pkgrel='2'
pkgdesc="introspect overloaded operators"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mro-compat' 'perl-package-stash>=0.14' 'perl-sub-identify' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-fatal')
url="https://metacpan.org/release/${_realname}"
source=("http://search.cpan.org/CPAN/authors/id/I/IL/ILMARI/${_realname}-${pkgver}.tar.gz")
md5sums=('607b65dfe9fdb47df780f3b22dcb7917')
sha512sums=('66ff0869ecd34b2a80e6c8052e9ba7cf396b85e25f2efa92e42447ae3164ac50f703ca4dbee38ac676b70caf19ce189a6d2a1d6322cf3af342d4edd5c0b336e7')
_distdir="Devel-OverloadInfo-0.005"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
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
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
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
