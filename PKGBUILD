# Maintainer: Martin Hundebøll <martin@hundeboll.net>

pkgname=tio
pkgver=3.2
pkgrel=1
pkgdesc="The simple TTY terminal I/O application"
url="https://tio.github.io/"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL-2.0-or-later')
depends=('glibc' 'lua' 'glib2')
optdepends=('bash-completion: bash completion support')
makedepends=('meson')
source=("https://github.com/tio/tio/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('9208e98dce783598a76c406f0b076f07dc0f645aaaab99ee5c3039744e8c0e2a')

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
