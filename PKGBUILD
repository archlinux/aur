# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-b-hooks-op-ppaddr'
pkgver='0.03'
pkgrel='1'
pkgdesc="Hook into opcode execution"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-extutils-depends>=0.302')
url='http://search.cpan.org/dist/B-Hooks-OP-PPAddr'
source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/B-Hooks-OP-PPAddr-0.03.tar.gz')
md5sums=('9f19e30db188ffdfed950a7cd62b9d17')
sha512sums=('a90e699f8d37b3a0f36dfbfe18416673a5fe7f0cf1a4df4874a27617e59b1fc5228852bffa2496532f56e5fe7a502096bc1c78b9487a2841ac86baae6eddf59c')
_distdir="B-Hooks-OP-PPAddr-0.03"

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
