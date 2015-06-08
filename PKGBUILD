# CPAN Name  : Mojolicious-Plugin-Mongodb
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-mojolicious-plugin-mongodb'
pkgver='1.16'
pkgrel='1'
pkgdesc="Use MongoDB in Mojolicious"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mojolicious>=0' 'perl-mongodb>=0' 'perl-tie-ixhash>=0')
makedepends=()
url='http://search.cpan.org/dist/Mojolicious-Plugin-Mongodb'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MADCAT/Mojolicious-Plugin-Mongodb-1.16.tar.gz')
md5sums=('f4a45325bb356004d19be7bb5c3fb65c')
sha512sums=('232ec34889792fb8bbff6002b5e9bd65b41966e68df2ce744700a522f51ede3ca36fb6818842c24aa05fe3ac7361916318e722c243fac922627fbdc26350f8d8')
_distdir="Mojolicious-Plugin-Mongodb-1.16"

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
