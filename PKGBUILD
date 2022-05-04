# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=budgie-screensaver
pkgver=5.0.1
pkgrel=1
pkgdesc='Screensaver for the Budgie Desktop'
arch=('x86_64')
license=('GPL2')
url='https://github.com/BuddiesOfBudgie/budgie-screensaver'
backup=('etc/pam.d/budgie-screensaver')
depends=('dbus-glib' 'libgnomekbd' 'gnome-desktop')
makedepends=('meson' 'intltool')
source=("https://github.com/BuddiesOfBudgie/$pkgname/releases/download/v$pkgver/$pkgname-v$pkgver.tar.xz"{,.asc})
sha256sums=('81fe6cccd938d9ef8d6cd46bbbad654ab8f7d108bbf1f96e9bf89b3ed5bafa0a'
            'SKIP')
validpgpkeys=('0E0D97562A4EC8BD8E329DCDAA7A2325E04B609B'  # Joshua Strobl <me@joshuastrobl.com>
              '8A59B135826B2DA453B9707408AD7343E6BD4B56') # Campbell Jones (Git) <git@serebit.com>

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
