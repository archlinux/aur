# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=abireport
pkgver=1.0.7
pkgrel=3
pkgdesc="Tool to create ABI reports from ELF binaries in packaging"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/clearlinux/abireport"
license=('Apache')
makedepends=('go')
optdepends=('rpm-org: extract rpm files'
            'dpkg: extract deb files'
            'unzip: extract eopkg files')
source=("https://github.com/clearlinux/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('2067c160c7a626299280c5b14b1197c0d29f42278145d1cd4de7742d5618fbfa07afa1c48f6c1f627d6323c37abbb60a78a74b442a2773d6714f7830900f6310')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
