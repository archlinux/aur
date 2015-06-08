# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-mongodbx-autoderef'
pkgver='1.110560'
pkgrel='1'
pkgdesc="Automagically dereference MongoDB DBRefs lazily"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-load' 'perl-data-visitor' 'perl-digest-sha1' 'perl-mongodb' 'perl-moose' 'perl-moosex-types' 'perl-moosex-types-structured' 'perl-namespace-autoclean' 'perl-perl6-junction' 'perl-try-tiny')
makedepends=()
url='http://search.cpan.org/dist/MongoDBx-AutoDeref'
source=('http://search.cpan.org/CPAN/authors/id/N/NP/NPEREZ/MongoDBx-AutoDeref-1.110560.tar.gz')
md5sums=('66d0d911b5791ff0c346e051a85373de')
sha512sums=('08063d83ee5f791a13718517ff5a18c78601057d125c52d53045b92d7af242abad4fa650355a709f035fc17130570709e94cac39e68dda2348ead800d179d2d7')
_distdir="MongoDBx-AutoDeref-1.110560"

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
