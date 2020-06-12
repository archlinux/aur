# Maintainer: quellen <lodgerz@gmail.com>
pkgname=epub2txt-git
pkgver=26.532e275
pkgrel=1
pkgdesc="Extract text from EPUB documents"
arch=('i686' 'x86_64')
url="https://github.com/kevinboone/epub2txt2"
license=('GPL')
makedepends=('git')
_gitname=epub2txt2
conflicts=('epub2txt')
source=("git+https://github.com/kevinboone/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make
}

package() {
mkdir -p "$pkgdir/usr/bin"
mkdir -p "$pkgdir/usr/share/man/man1"
cp -p "${_gitname}/epub2txt" "$pkgdir/usr/bin/"
install -Dm644 "${_gitname}/man1/epub2txt.1" "$pkgdir/usr/share/man/man1/"
} 