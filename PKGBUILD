# Maintainer: lmartinez-mirror
# Contributor: Morten Linderud <foxboron@archlinux.org>
pkgname=smenu-git
pkgver=0.9.17.r13.gab186c4
pkgrel=1
epoch=1
pkgdesc="A powerful and versatile selection tool for interactive or scripting use"
arch=('x86_64')
url="https://github.com/p-gen/smenu"
license=('GPL')
depends=('ncurses')
makedepends=('git')
provides=('smenu')
conflicts=('smenu')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$pkgname"
  ./build.sh --prefix=/usr
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
