# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-packagemanager-virtual'
pkgver='0.191250'
pkgrel='1'
pkgdesc="A moose role interface for package managers."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=('perl-module-build-tiny>=0.034')
url='https://metacpan.org/release/PackageManager-Virtual'
source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOUBLED/PackageManager-Virtual-0.191250.tar.gz')
md5sums=('e326de70098be521793f28afeca48db8')
sha512sums=('49cd18a2922efdc69e3f3b12bd5d796eda0cc6e3a1c1f4d28e4e4497152001380f4a19029029932fc5c29a8b52f09426d49d735d53a8f2d63d2fe48137084ea3')
_distdir="PackageManager-Virtual-0.191250"

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
