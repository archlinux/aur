# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=abireport
pkgver=1.0.10
pkgrel=1
pkgdesc="Tool to create ABI reports from ELF binaries in packaging"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/clearlinux/abireport"
license=('Apache')
makedepends=('go')
optdepends=('rpm-org: extract rpm files'
            'dpkg: extract deb files'
            'unzip: extract eopkg files')
source=("https://github.com/clearlinux/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha512sums=('32e92f53739ed0df533528b6fcf11748f7bbd293b306109f779478533c8287cdb8b4d995a1b58c1da4e423b7dfb1a5c858f9a6e0cc96e10fbe977657cb26d59c')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
