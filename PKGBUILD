# Maintainer: Martin Hundebøll <martin@hundeboll.net>

pkgname=tio
pkgver=3.8
pkgrel=1
pkgdesc="The simple TTY terminal I/O application"
url="https://tio.github.io/"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL-2.0-or-later')
depends=('glibc' 'lua' 'glib2')
optdepends=('bash-completion: bash completion support')
makedepends=('meson')
source=("https://github.com/tio/tio/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('a24c69e59b53cf72a147db2566b6ff3b6a018579684caa4b16ce36614b2b68d4')

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
