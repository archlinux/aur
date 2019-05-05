# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moosex-has-sugar'
pkgver='1.000006'
pkgrel='1'
pkgdesc="Sugar Syntax for moose 'has' fields"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-sub-exporter-progressive>=0' 'perl-namespace-clean>=0' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-fatal>=0')
url='https://metacpan.org/release/MooseX-Has-Sugar'
source=('http://search.cpan.org/CPAN/authors/id/K/KE/KENTNL/MooseX-Has-Sugar-1.000006.tar.gz')
md5sums=('122e1c99271c9b74a0e294db8e5f8657')
sha512sums=('e2d8622f3b06f24dd859541d5aeda6fc44f92b9c42ff4f64df48082a07ca52fca7fad011767962d48ec1b3d34a6a3b43f54ba4b764cc4b4f7f7a829a3c638af2')
_distdir="MooseX-Has-Sugar-1.000006"

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
