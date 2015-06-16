# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-perl-tags'
pkgver='0.32'
pkgrel='1'
pkgdesc="Generate (possibly exuberant) Ctags style tags for Perl sourcecode"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-capture-tiny' 'perl-file-find-rule' 'perl-module-locate' 'perl-path-tiny')
makedepends=()
checkdepends=('perl-test-exception' 'perl-test-longstring' 'perl-test-strict')
url='http://search.mcpan.org/dist/Perl-Tags'
source=('http://search.mcpan.org/CPAN/authors/id/O/OS/OSFAMERON/Perl-Tags-0.32.tar.gz')
md5sums=('932784defc0460075130c42f48e5b198')
sha512sums=('e2042b6c0e54a4c296f182446a1de21d5a1da367bc5f9d0362f4b133e226624b81eed85fd27cdd4bd618349bf447893a1c96a6aede2e22b5db234d67d20fb0fc')
_distdir="Perl-Tags-0.32"

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
