# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-readmefrompod'
pkgver='0.37'
pkgrel='1'
pkgdesc="dzil plugin to generate README from POD"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla>=6.000' 'perl-io-string>=0' 'perl-moose>=0' 'perl-path-tiny>=0.004' 'perl-pod-readme>=1.2.0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Dist-Zilla-Plugin-ReadmeFromPod'
source=('http://search.cpan.org/CPAN/authors/id/F/FA/FAYLAND/Dist-Zilla-Plugin-ReadmeFromPod-0.37.tar.gz')
md5sums=('48cb81600a62e5aad90bd53a32a21fa8')
sha512sums=('3dd828b02a406581a78b318a704ef946e8f623674e6ee6eca8e9998010d337b7671fe4651230d3805ba2c2edc2c870e4e820a6a5ebf7e9e44bc3408ca00049f1')
_distdir="Dist-Zilla-Plugin-ReadmeFromPod-0.37"

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
