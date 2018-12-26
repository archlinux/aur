# Contributor: Natal Ngétal <hobbestigrou@erakis.im>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname=perl-io-pty-easy
pkgver=0.10
pkgrel=1
pkgdesc="Easy interface to IO::Pty"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-tty')
makedepends=()
url='http://search.cpan.org/dist/IO-Pty-Easy'
source=("http://search.cpan.org/CPAN/authors/id/D/DO/DOY/IO-Pty-Easy-${pkgver}.tar.gz")
md5sums=('2892ee94695277f8f39365e79b997643')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/IO-Pty-Easy-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

false &&
check() {
  cd "${srcdir}/IO-Pty-Easy-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/IO-Pty-Easy-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
