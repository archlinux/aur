# Maintainer: Martin Hundebøll <martin@hundeboll.net>

pkgname=tio
pkgver=3.3
pkgrel=1
pkgdesc="The simple TTY terminal I/O application"
url="https://tio.github.io/"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL-2.0-or-later')
depends=('glibc' 'lua' 'glib2')
optdepends=('bash-completion: bash completion support')
makedepends=('meson')
source=("https://github.com/tio/tio/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('506635b2e922306be3ded980d0b6fd8bb74647b1561b01015b769041f7ddca8d')

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
