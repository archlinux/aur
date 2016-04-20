# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-git-version-compare'
pkgver='1.001'
pkgrel='1'
pkgdesc="Functions to compare Git versions"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-namespace-clean' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Git-Version-Compare'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOOK/Git-Version-Compare-1.001.tar.gz')
md5sums=('dcba8c3627c9e22f9e9d928acf227139')
sha512sums=('a206dc18db0ce1e7d65a0ec8d74770b66ef5cd0db77dd402aa4bcc5e6126b8c78376b439b22919d6865e222ddfc59c9bad901b0b476b2a9dab57a34f33391e8e')
_distdir="Git-Version-Compare-1.001"

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
