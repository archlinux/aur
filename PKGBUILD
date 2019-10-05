# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=abireport
pkgver=1.0.7
pkgrel=1
pkgdesc="Tool to create ABI reports from ELF binaries in packaging"
arch=('i686' 'x86_64')
url="https://github.com/clearlinux/abireport"
license=('Apache')
makedepends=('go')
optdepends=('rpm-org: extract rpm files'
            'dpkg: extract deb files'
            'unzip: extract eopkg files')
source=("https://github.com/clearlinux/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c46c46bff3dc873cb84a66c639c38b2df14f095d95a4bb77e3b96904b8219399')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}


# vim:set ts=8 sts=2 sw=2 et:
