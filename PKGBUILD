# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-digest-simd'
pkgver='0.04'
pkgrel='1'
pkgdesc="Perl interface to the SIMD digest algorithm"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Digest-SIMD'
source=('http://search.cpan.org/CPAN/authors/id/G/GR/GRAY/Digest-SIMD-0.04.tar.gz')
md5sums=('704a5e7d857e7005c493ce73d898357f')
sha512sums=('fc4e9afd508a098af65e06f7ca535e181a706efa403a550bf674bfc380ca0843987db56b46739f264dbc59d1e13921021e35999fbe32c6aa34bf344aa80b8ce8')
_distdir="Digest-SIMD-0.04"

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
