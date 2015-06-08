# CPAN Name  : Text-Table
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-text-table'
pkgver='1.130'
pkgrel='1'
pkgdesc="Organize Data in Tables"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-text-aligner>=0.05')
makedepends=()
url='http://search.cpan.org/dist/Text-Table'
source=('http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Text-Table-1.130.tar.gz')
md5sums=('bdd095ee4341b85231706a7d19d254f6')
sha512sums=('8e19b2713202efcf2c50e69547ac4673fdc108165c49fba1dd7143875282de9c33acfe2a9ce2f03f5d7d07b34178bbb0944c97637e09811aa3dc219f20e0c09f')
_distdir="Text-Table-1.130"

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
