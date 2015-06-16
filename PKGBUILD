# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-file-find-rule-perl'
pkgver='1.13'
pkgrel='1'
pkgdesc="Common rules for searching for Perl things"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-find-rule>=0.20' 'perl-params-util>=0.38' 'perl')
makedepends=()
url='http://search.mcpan.org/dist/File-Find-Rule-Perl'
source=('http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/File-Find-Rule-Perl-1.13.tar.gz')
md5sums=('c3ee4f00f643f82fdb6f1cbcebfa90de')
sha512sums=('87f1372b9af8fe678cb512df4797ef3d128a72b262c7687d1f18d487deef99f2e2bb54fff1a1a3f17ec42cab47b40c6afa14b38514c53e9a6cce42d4202a3842')
_distdir="File-Find-Rule-Perl-1.13"

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
