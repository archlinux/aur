# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Jan Tojnar <jtojnar@gmail.com>

pkgname=perl-test-file-contents
pkgver=0.242
pkgrel=1
pkgdesc="Test routines for examining the contents of files"
arch=('any')
url="https://metacpan.org/release/Test-File-Contents"
license=('PerlArtistic')
depends=('perl' 'perl-text-diff')
source=("https://www.cpan.org/modules/by-module/Test/Test-File-Contents-${pkgver}.tar.gz")
sha512sums=('fe790800196343a5d14de12a81f95dc151bc2068401e2302a5916095d1b227d95a2e8a3008f6abc257f4120dd0ae933bd2fb2a8ce651559958ef38705c94b8d4')

build() {
  cd "${srcdir}/Test-File-Contents-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Test-File-Contents-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Test-File-Contents-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
