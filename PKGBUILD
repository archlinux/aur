# Maintainer: Michael Herzberg <{firstname}@{firstinitial}{lastname}.de>
# Contributor: Brett Gilio <owner@brettgilio.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Mort Yao <soi@mort.ninja>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=fsharp-git
pkgver=r6614.15bd45404
pkgrel=1
pkgdesc="The F# Compiler, Core Library & Tools (F# Software Foundation Repository) (master branch)"
arch=('any')
url="http://fsharp.org/"
license=('MIT')
provides=('fsharp')
conflicts=('fsharp')
depends=('mono' 'msbuild-stable')
makedepends=(git)
source=("git+https://github.com/fsharp/fsharp")
sha256sums=('SKIP')

pkgver() {
  cd fsharp
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd fsharp
  make
}

package() {
  cd fsharp
  make DESTDIR="$pkgdir" install
}
