# CPAN Name  : Data-Tabular
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-data-tabular'
pkgver='0.29'
pkgrel='1'
pkgdesc="Handy Table Manipulation and rendering Object"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.0')
makedepends=()
url='http://search.cpan.org/dist/Data-Tabular'
source=('http://search.mcpan.org/CPAN/authors/id/G/GA/GAM/Data-Tabular-0.29.tar.gz')
md5sums=('635c534f237db3e22f906fdecd63cd07')
sha512sums=('3254d7ea8b81290d7decd29f0b24b86f696fbe5add6efeedd0c24fb03c35905f1e221a12f0911e3bfeaa27d7c19ef923f41fdfa74a8c4cc9b479413daaa59667')
_distdir="Data-Tabular-0.29"

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
