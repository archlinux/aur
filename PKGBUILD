# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=mumble-chat-git
epoch=1
pkgver=0.288.6c893a8
pkgrel=1
pkgdesc="A ncurses interface for Mumble"
arch=('i686' 'x86_64')
url="https://github.com/mr/mumble-chat"
license=('MIT')
makedepends=('git')
source=(
  'git+git://github.com/mr/mumble-chat.git'
)

sha256sums=(
  'SKIP'
)
_gitname="mumble-chat"

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo "0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}


build() {
  cd "${srcdir}/${_gitname}"
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  install -D mumble-chat "${pkgdir}/usr/bin/mumble-chat"
}
