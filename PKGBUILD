# Maintainer: Icelk <main@icelk.dev>

pkgname=swaylock-1.5
pkgver=1.5
pkgrel=1
pkgdesc="Screen locker for Wayland with layers support, enabling dynamic compositor blurring"
arch=('i686' 'x86_64')
url="https://github.com/swaywm/swaylock"
license=('MIT')
provides=('swaylock')
conflicts=('swaylock')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('wayland' 'libxkbcommon' 'pam' 'cairo' 'gdk-pixbuf2')
makedepends=('meson' 'git' 'scdoc' 'wayland-protocols')
#source=("https://github.com/swaywm/swaylock/archive/refs/tags/1.5.tar.gz")
source=("$pkgname::git+$url")
sha1sums=('SKIP')

build() {
	cd "$pkgname"
    git checkout 366db56553ee02334871756ab19c72d2171ad364
	meson build --prefix=/usr
	ninja -C build
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir" ninja -C build install
}
