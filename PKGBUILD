# Maintainer: Alad Wenter <alad at archlinux dot org>
# Contributor: Archer777 <NAME at gmx dot com>

_realname=Compiler-Lexer
pkgname=perl-compiler-lexer
pkgver=0.23
pkgrel=1
pkgdesc="Lexical Analyzer for Perl5"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=('perl-module-build' 'perl-module-build-xsutil')
url='http://search.cpan.org/dist/Compiler-Lexer'
source=("https://cpan.metacpan.org/authors/id/G/GO/GOCCY/${_realname}-${pkgver}.tar.gz")
sha256sums=('6031ce4afebbfa4f492a274949be7b8232314e91023828c438e47981ff0a99db')

build() {
  cd "${_realname}-${pkgver}"
  perl Build.PL --installdirs=vendor
  ./Build
}

check() {
  cd "${_realname}-${pkgver}"
  ./Build test
}

package() {
  cd "${_realname}-${pkgver}"
  ./Build install --destdir="${pkgdir}"
}
