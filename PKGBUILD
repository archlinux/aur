# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-hash-util-fieldhash-compat'
pkgver='0.07'
pkgrel='1'
pkgdesc="Use Hash::Util::FieldHash or ties, depending on availability"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
checkdepends=('perl-test-use-ok')
url='http://search.mcpan.org/dist/Hash-Util-FieldHash-Compat'
source=('http://search.mcpan.org/CPAN/authors/id/E/ET/ETHER/Hash-Util-FieldHash-Compat-0.07.tar.gz')
md5sums=('e53d60f6857fb0d3fae893030441b315')
sha512sums=('1d12a40a17c7ba3ca82cfda975580dc83f9475db4784988a141ed15a6d4c6bf9fda1c223023c68e603b51dfa2166620a679600ccab00265da3c1042d7a7ee7f6')
_distdir="Hash-Util-FieldHash-Compat-0.07"

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
