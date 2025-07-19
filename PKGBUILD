# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-catalyst-view-tt'
pkgver='0.46'
pkgrel='2'
pkgdesc="Template View Class"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime>=0' 'perl-class-accessor>=0' 'perl-data-dump>=0' 'perl-mro-compat>=0' 'perl-path-class>=0' 'perl-template-timer>=0' 'perl-template-toolkit>=0' 'perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/Catalyst-View-TT'
source=("http://search.cpan.org/CPAN/authors/id/J/JJ/JJNAPIORK/Catalyst-View-TT-$pkgver.tar.gz")
md5sums=('7ca95c98aea019e0acadc09cad418dd3')
sha512sums=('104f1637362d7ecfe0c35fc0457c188045daf9faa91cee826aa18da5bd10a065cadc9d11fe2c272d6d1e1953c2167d2faddef15ef08a85afa596a9ca31efd931')
_distdir="Catalyst-View-TT-$pkgver"

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
