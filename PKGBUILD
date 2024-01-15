# Maintainer: Felix Potthast <mail AT felix MINUS potthast DOT de>
# Contributor: Philipp Joram <mail AT phijor DOT me>

pkgname=picasso-3ds-git
_gitname=picasso
pkgrel=1
pkgver=r100.d522455
epoch=1
pkgdesc="Picasso shader assembler for 3DS homebrew"
arch=('any')
url="https://github.com/fincs/picasso/"
license=('custom')
groups=()
makedepends=('gcc' 'autoconf' 'automake')

source=('git+https://github.com/fincs/picasso.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  ./autogen.sh
  ./configure
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  install -Dm755 "$srcdir/${_gitname}/${_gitname}" "$pkgdir/usr/bin/${_gitname}"
}
