# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-yaml-libyaml'
pkgver='0.59'
pkgrel='1'
pkgdesc="Perl YAML Serialization using XS and libyaml"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='http://search.mcpan.org/dist/YAML-LibYAML'
source=('http://search.mcpan.org/CPAN/authors/id/I/IN/INGY/YAML-LibYAML-0.59.tar.gz')
md5sums=('733e63b743088781eb8cad6477cd4905')
sha512sums=('0c0bdbd7d93352b1e60f41f185f2947b163a9ea7074945c933850a3d165f75dd202403406f9e355e78535ae7d1726f2328dc006af7a01a6f30c48999013da3bc')
_distdir="YAML-LibYAML-0.59"

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
