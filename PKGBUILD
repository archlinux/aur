# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-checkextratests'
pkgver='0.029'
pkgrel='1'
pkgdesc="check xt tests before release"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-capture-tiny>=0' 'perl-dist-zilla>=4.3' 'perl-file-pushd>=0' 'perl-moose>=2' 'perl-params-util>=0' 'perl-path-iterator-rule>=0' 'perl-path-tiny>=0.013' 'perl-sub-exporter>=0' 'perl-try-tiny>=0' 'perl-namespace-autoclean>=0.09' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-requires>=0')
url='https://metacpan.org/release/Dist-Zilla-Plugin-CheckExtraTests'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Dist-Zilla-Plugin-CheckExtraTests-0.029.tar.gz')
md5sums=('0023aa64d72b98ce3c4d674f1b102aec')
sha512sums=('f4c83a8256dd044b5b4fe6ea2dd282708507199aff7966c5e07646de548455e726852088b2435927ce73e6b4a35c6e1a9f393ae00b048052c4f464830618f31c')
_distdir="Dist-Zilla-Plugin-CheckExtraTests-0.029"

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
