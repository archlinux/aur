# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: bemxio <bemxiov at protonmail dot com>
# Contributor: Joe Carta <cartakid at gmail dot com>
# Contributor: sidious/SiD <miste78 web de>
# Contributor: Wes Brewer <brewerw@gmail.com>

pkgname=extract-xiso
pkgver=202501282328
_pkgver=build-$pkgver
pkgrel=1
pkgdesc="Xbox ISO Creation/Extraction utility"
url="https://github.com/XboxDev/extract-xiso"
license=("BSD-4-Clause")
arch=('x86_64')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
sha256sums=('0d680e6ababd17410b355a41f7d689402cd5439522f7d144f2ecb7d051756418')

prepare() {
  cd $pkgname-$_pkgver
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release
}

build() {
  cd $pkgname-$_pkgver/build
  make
}

package() {
  cd $pkgname-$_pkgver
  install -Dm644 LICENSE.TXT -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm755 build/$pkgname -t "$pkgdir/usr/bin"
}
