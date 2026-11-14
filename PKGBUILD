# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=pla-util
pkgver=3.0.0
pkgrel=2
pkgdesc='A power line adapter utility for Linux'
arch=(x86_64)
url='https://github.com/serock/pla-util'
license=(GPL-3.0-or-later)
depends=(glibc libgcc libpcap gcc-ada)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('92fb26ce38eb2d5a7af484aabf80f1a1b1ae7d77af64c599743fa863e7c7749e7f4146fddb566026e58643313570c698326adb7a34eb9622c98c0bfa0feb434e')

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
