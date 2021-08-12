# Maintainer: Paul Clark <paul500clark at gmail dot com>
_perlmod='Text-LevenshteinXS'
pkgname="perl-text-levenshteinxs"
pkgver='0.03'
pkgrel='1'
pkgdesc="An XS implementation of the Levenshtein edit distance"
arch=('x86_64')
url="https://metacpan.org/release/${_perlmod}"
license=('PerlArtistic' 'GPL')
depends=('perl')
source=("https://search.cpan.org/CPAN/authors/id/J/JG/JGOLDBERG/${_perlmod}-${pkgver}.tar.gz")
sha256sums=('e374ff7b237919ce5ea9245f356d1cb52cc87fd26b3a5a38b3f3e5ff82a01491')

build() {
  cd "${_perlmod}-${pkgver}"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl 'Makefile.PL' INSTALLDIRS='vendor'
  make
}

check() {
  cd "${_perlmod}-${pkgver}"
  make test
}

package() {
  cd "${_perlmod}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}
