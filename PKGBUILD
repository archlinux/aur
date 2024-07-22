# Maintainer: Martin Hundebøll <martin@hundeboll.net>

pkgname=tio
pkgver=3.6
pkgrel=1
pkgdesc="The simple TTY terminal I/O application"
url="https://tio.github.io/"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL-2.0-or-later')
depends=('glibc' 'lua' 'glib2')
optdepends=('bash-completion: bash completion support')
makedepends=('meson')
source=("https://github.com/tio/tio/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('04a91686f8a19f157b885a7c146a138b4cff6a3fb8dba48723d1fdad15c61167')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  meson setup --prefix=/usr --buildtype=plain . build
  meson compile -C build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  meson install -C build --destdir "$pkgdir"
}

# vim:set ts=2 sw=2 et:
