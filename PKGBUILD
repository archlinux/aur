# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-object-destroyer'
pkgver='2.02'
pkgrel='1'
pkgdesc="Make objects with circular references DESTROY normally"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Object-Destroyer'
source=('http://search.cpan.org/CPAN/authors/id/S/SI/SIMBABQUE/Object-Destroyer-2.02.tar.gz')
md5sums=('aad9be3ed0f1a14a7a6f07a934459378')
sha512sums=('22fb0de192414182d13f20f3d331bf1f69258a6cdda42e84d929a29862b5c3bbd73ddbf45c2ed55ae064618a28c0e101bc8267ea8553720000aebdc865eaf108')
_distdir="Object-Destroyer-2.02"

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
