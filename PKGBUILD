# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-class-base'
pkgver='0.09'
pkgrel='1'
pkgdesc="useful base class for deriving other modules "
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-clone>=0')
makedepends=()
checkdepends=('perl>=5.006')
url='https://metacpan.org/release/Class-Base'
source=('http://search.cpan.org/CPAN/authors/id/Y/YA/YANICK/Class-Base-0.09.tar.gz')
md5sums=('9303570e4f9cd09310259a8b44e58322')
sha512sums=('c6915499861367f188d7deff0e7e3079fb3d73c7c4b8d9af7e6ff4fed6e37d60cbee242ef7e781bf014940b71478e5a05d97fc35eb8994473927cd0bcc6c7bbd')
_distdir="Class-Base-0.09"

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
