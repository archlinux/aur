# Maintainer:  Simon Perry <aur [at] sanxion [dot] net>
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-mail-gnupg'
_pkgname='Mail-GnuPG'
pkgver='0.23'
pkgrel='4'
pkgdesc="MIME Email <-> GnuPG::Interface interface"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-gnupg-interface' 'perl-mailtools' 'perl-mime-tools' 'perl-moox-late' 'perl-moox-handlesvia' 'perl-data-perl')
makedepends=('perl-test-pod')
url='http://search.cpan.org/dist/Mail-GnuPG'
source=("http://search.cpan.org/CPAN/authors/id/D/DD/DDB/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('cf3c00ddb334020c9431e6a3af71fb6651ca647706ef3daab96e5d26347807f4')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB="" \
      PERL_AUTOINSTALL=--skipdeps \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='${pkgdir}'" \
      PERL_MB_OPT="--installdirs vendor --destdir '${pkgdir}'" \
      MODULEBUILDRC=/dev/null

    perl Build.PL
    perl Build
  )
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  perl Build install
  find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
