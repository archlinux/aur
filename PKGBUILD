# Contributor: lmartinez-mirror
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: tee < teeaur at duck dot com >
pkgname=smenu-git
pkgver=1.5.0.r26.gc8040eb
pkgrel=1
epoch=1
pkgdesc="A powerful and versatile selection tool for interactive or scripting use"
arch=('x86_64')
url="https://github.com/p-gen/smenu"
license=('MPL-2.0')
depends=('ncurses')
makedepends=('git')
provides=('smenu')
conflicts=('smenu')
source=("$pkgname::git+$url")
b2sums=('SKIP')

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
