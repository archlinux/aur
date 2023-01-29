# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: Campbell Jones <arch at serebit dot com>

pkgname=budgie-screensaver
pkgver=5.1.0
pkgrel=2
pkgdesc='Screensaver for the Budgie Desktop'
arch=('x86_64')
license=('GPL2')
url='https://github.com/BuddiesOfBudgie/budgie-screensaver'
backup=('etc/pam.d/budgie-screensaver')
groups=('budgie')
depends=('dbus-glib' 'libgnomekbd' 'gnome-desktop')
makedepends=('meson' 'intltool')
source=("https://github.com/BuddiesOfBudgie/$pkgname/releases/download/v$pkgver/$pkgname-v$pkgver.tar.xz"{,.asc})
sha256sums=('563ac3f845729e9e6d184d2dbf036ab3f51ff244c27f5b286cfcb89acc147f0c'
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
