# Maintainer: aditya-K2 <adityakurdunkar2@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=gspt-git
pkgver=r317.f85809c
pkgrel=1
pkgdesc='Spotify for Terminal written in Go.'
arch=('x86_64')
url="https://github.com/aditya-K2/gspt"
license=('GPL3')
makedepends=('git' 'go' 'make')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
   cd "$pkgname"
   git config --global --add safe.directory "$(pwd)"
}

build() {
    cd "$pkgname"
}

package() {
    cd "$pkgname"
    sudo make install
}
