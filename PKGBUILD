# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=abireport
pkgver=1.0.11
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
sha512sums=('8881a579956c6646457c6f16a84b3ce1abe38e419a1c0000d2841014df04873074641c904da8cefd9d93129a987b1693f799808b52438c83f10f8ea28129a950')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
