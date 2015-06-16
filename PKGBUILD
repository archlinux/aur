# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-class-xsaccessor'
pkgver='1.19'
pkgrel='1'
pkgdesc="Generate fast XS accessors without runtime compilation"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Class-XSAccessor'
source=('http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/Class-XSAccessor-1.19.tar.gz')
md5sums=('5c5dea74f00ad37c5119dd22b28a5563')
sha512sums=('58855bb2108b60cc90ae1d1c4d6a011da7bac2d063c7c953ff8610ae164ba60731a664f0fbddf148e1eabb60042913a17633a9c9a8936a23a59130b381bf63f8')
_distdir="Class-XSAccessor-1.19"

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
