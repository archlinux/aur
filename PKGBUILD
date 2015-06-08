# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-anyevent-run'
pkgver='0.01'
pkgrel='1'
pkgdesc="Run a process or coderef asynchronously"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-anyevent>=4.85')
makedepends=()
url='http://search.cpan.org/dist/AnyEvent-Run'
source=('http://search.cpan.org/CPAN/authors/id/A/AG/AGRUNDMA/AnyEvent-Run-0.01.tar.gz')
md5sums=('833eea259979ab3d3244080a6efde98c')
sha512sums=('3a1785fd20f0d583b2a2da594cb6518b0eb6210fb061a9de5fc80cf39b95f75c6bbf8ee3485251496d2e73788e06637140ff311981bc8a6186841c0dc9f3d3b1')
_distdir="AnyEvent-Run-0.01"

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
