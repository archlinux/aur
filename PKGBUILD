# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-ppix-editortools'
pkgver='0.19'
pkgrel='1'
pkgdesc="Utility methods and base class for manipulating Perl via PPI"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-xsaccessor>=1.02' 'perl-ppi>=1.215' 'perl-try-tiny>=0.11' 'perl')
makedepends=('perl-test-most')
checkdepends=('perl-test-differences' 'perl-test-nowarnings>=0.084')
url='http://search.mcpan.org/dist/PPIx-EditorTools'
source=('http://search.mcpan.org/CPAN/authors/id/S/SZ/SZABGAB/PPIx-EditorTools-0.19.tar.gz')
md5sums=('8ceaa3b9c8b2a5d3b601f99be4afe0f2')
sha512sums=('363ca55cc4c03ed2a672ea2429c09656a567450f2be47f3c8f42ae0ac3c14c9d7b99660f61f7cba61dbe94680ee1663d77c9415965e444449b2489e3a2c18faa')
_distdir="PPIx-EditorTools-0.19"

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
