# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-xml-treebuilder'
pkgver='5.4'
pkgrel='1'
pkgdesc="Parser that builds a tree of XML::Element objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-tagset>=3.02' 'perl-html-tree' 'perl-xml-catalog>=1.02' 'perl-xml-parser')
makedepends=()
url='http://search.mcpan.org/dist/XML-TreeBuilder'
source=('http://search.mcpan.org/CPAN/authors/id/J/JF/JFEARN/XML-TreeBuilder-5.4.tar.gz')
md5sums=('bf2d9102b62516f6e76c248acb9e8a2c')
sha512sums=('0c1b9ebe96d7a5650abb5ba02a65fe674e2ba767e0fd34f38b560e79af4f0ac584cc3027a8c75c5cd9d53c441b5c89bfc48bb86f685a427c13955b8aa8ba5bdd')
_distdir="XML-TreeBuilder-5.4"

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
