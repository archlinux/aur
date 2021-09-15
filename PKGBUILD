# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Jan Tojnar <jtojnar@gmail.com>

pkgname=perl-test-file-contents
pkgver=0.23
pkgrel=2
pkgdesc="Test routines for examining the contents of files"
arch=('any')
url="https://metacpan.org/release/Test-File-Contents"
license=('PerlArtistic')
depends=('perl' 'perl-text-diff')
makedepends=('perl-module-build' 'perl-test-pod' 'perl-test-pod-coverage')
optdepends=('perl-test-pod' 'perl-test-pod-coverage')
source=("https://www.cpan.org/modules/by-module/Test/Test-File-Contents-${pkgver}.tar.gz")
sha512sums=('8fe830e755660b32f79a82b84b55702a6dd2bd62136c456325340646fe11e82b5603fb3063fcbad393edaf68cabf84da79103be5ef4a5cb6de84ad8463de46db')

build() {
  cd "${srcdir}/Test-File-Contents-${pkgver}"

  perl Build.PL create_packlist=0
  ./Build
}

check() {
  cd "${srcdir}/Test-File-Contents-${pkgver}"

  ./Build test
}

package() {
  cd "${srcdir}/Test-File-Contents-${pkgver}"

  ./Build install --installdirs=vendor --destdir="${pkgdir}"
}
