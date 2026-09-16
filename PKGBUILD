# Maintainer: lunagoat (https://github.com/lunagoat)
# SPDX-License-Identifier: MIT
pkgname=tty-terminal
pkgver=0.1.0
pkgrel=1
pkgdesc='Linux TTY styling with the Kitty engine and native inline images'
arch=('any')
url='https://github.com/lunagoat/tty-terminal'
license=('MIT' 'GPL-2.0-only')
depends=('python>=3.11' 'kitty>=0.48.2' 'fontconfig')
makedepends=('python-fonttools')
checkdepends=('desktop-file-utils')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/1.0.0/$pkgname-$pkgver.tar.gz")
sha256sums=('32c2fbd3818eebbcd1922723e0c574d225a21ae5c35c2bea57a1a7bbc257cf30')

build() {
  cd "$pkgname-$pkgver"
  make PYTHON=/usr/bin/python
}

check() {
  cd "$pkgname-$pkgver"
  make check PYTHON=/usr/bin/python
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
