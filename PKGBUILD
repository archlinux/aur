# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pika-backup
pkgver=0.1.2
pkgrel=1
pkgdesc="Simple backups based on borg"
arch=('x86_64')
url="https://gitlab.gnome.org/World/pika-backup"
license=('GPL')
depends=('borg' 'gtk3')
makedepends=('meson' 'rust')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('225f4eaa0ce78ee635191e874529c0a53abbee8014d71916604d192f4000abe3')

build() {
	arch-meson "$pkgname-v$pkgver" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
