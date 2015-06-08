# Contributor: AUR Perl <aurperl@juster.info>
# Generator  : CPANPLUS::Dist::Arch 1.18

pkgname='perl-carp-assert'
_pkgname='Carp-Assert'
pkgver='0.20'
pkgrel='2'
pkgdesc="Stating the obvious to let the computer know"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Carp-Assert'
source=("http://search.cpan.org/CPAN/authors/id/M/MS/MSCHWERN/${_pkgname}-${pkgver}.tar.gz")
md5sums=('9dafe361b9e5e93e8e3e70e015f6b191')
sha512sums=('208e30f549c1d911623faa0685b87119d80b56caa2fee22b760ac1927d6174afb73124f16a769302783dcdddfb50e9f6538394eca9d0b139dfc06292e7025ec1')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_pkgname}-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
