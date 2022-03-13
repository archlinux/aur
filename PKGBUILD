# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=budgie-screensaver
pkgver=5.0
pkgrel=1
pkgdesc='Screensaver for the Budgie Desktop'
arch=('x86_64')
license=('GPL')
url='https://github.com/getsolus/budgie-screensaver'
backup=('etc/pam.d/budgie-screensaver')
depends=('dbus-glib' 'libgnomekbd' 'gnome-desktop')
makedepends=('meson' 'intltool')
source=("https://github.com/BuddiesOfBudgie/$pkgname/releases/download/v$pkgver/$pkgname-v$pkgver.tar.xz"{,.asc})
sha256sums=('611969a9f53e5d3148cad7445e95c94bfff6ea61c2f339969ecb5d9b51f6b871'
            'SKIP')
validpgpkeys=('0E0D97562A4EC8BD8E329DCDAA7A2325E04B609B') # Joshua Strobl <me@joshuastrobl.com>

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
