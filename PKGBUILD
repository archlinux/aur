# Maintainer: Daniel Maurice Davis <daniel.maurice.davis@gmail.com>

_gitname=p5-Compiler-Lexer
pkgname=perl-compiler-lexer-git
pkgver=214.28116e6
pkgrel=1
pkgdesc='Lexical Analyzer for Perl5'
url='https://github.com/goccy/p5-Compiler-Lexer'
license=('PerlArtistic' 'GPL')
source=('git+https://github.com/goccy/p5-Compiler-Lexer')
md5sums=('SKIP')
arch=('i686' 'x86_64')
depends=('perl>=5.8.1')
makedepends=('perl-module-build' 'perl-module-build-xsutil')
conflicts=('perl-compiler-lexer')
provides=('perl-compiler-lexer')
options=('!emptydirs')

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  perl Build.PL --installdirs=vendor
  ./Build
}

check() {
  cd "${_gitname}"
  ./Build test
}

package() {
  cd "${_gitname}"
  ./Build install --installdirs=vendor --destdir="${pkgdir}"
}