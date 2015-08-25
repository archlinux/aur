pkgname=picasso-3ds-git
_gitname=picasso
pkgrel=1
pkgver=cefa910b5887f62f82bac6de0c67ffefd20b824f
pkgdesc="Picasso shader assembler for 3DS homebrew"
arch=('any')
url="https://github.com/fincs/picasso/"
license=('custom')
groups=()
makedepends=('gcc' 'autoconf' 'automake')

source=('picasso::git://github.com/fincs/picasso')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --always | sed 's|-|.|g'
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
