# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-proc-invokeeditor'
pkgver='1.13'
pkgrel='1'
pkgdesc="Perl extension for starting a text editor"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-carp-assert>=0.11')
makedepends=()
url='https://metacpan.org/release/Proc-InvokeEditor'
source=('http://search.cpan.org/CPAN/authors/id/M/MS/MSTEVENS/Proc-InvokeEditor-1.13.tar.gz')
md5sums=('26595c1e1c80ed64f0fb97cceea7e167')
sha512sums=('1048f2e825ef9324f566393dcc808a6b6c3a2080d202399369e05a266f97b8174f4f3e2a39fa75c55aafb2d2913da4909b1112acd2e804dc479a81ebd7a9348f')
_distdir="Proc-InvokeEditor-1.13"

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
