# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=pla-util
pkgver=3.0.0
pkgrel=1
pkgdesc='A power line adapter utility for Linux'
arch=(x86_64)
url='https://github.com/serock/pla-util'
license=(GPL-3.0-or-later)
depends=(glibc gcc-libs libpcap gcc-ada)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('77fdf30023ffa81ee3046bd26337ce24852680d16373a9848c64e413ca7d3c85f171e3b5a7de5998a24fafe9dd973eda4a73d3f198759fe10b6fda2ad00b9c3c')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 bin/pla-util "$pkgdir"/usr/bin/pla-util
  install -Dm644 completions/pla-util "$pkgdir"/usr/share/bash-completion/completions/pla-util
}

# vim:set ts=2 sw=2 et:
