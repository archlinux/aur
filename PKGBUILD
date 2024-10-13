# Maintainer: Roshless <pkg@roshless.com>

pkgname=ttea
pkgrel=1
pkgver=1.3.0
pkgdesc="CLI tea manager"
url="https://git.roshless.me/~roshless/ttea"
arch=('x86_64' 'i686')
license=("GPL")
source=("https://git.roshless.me/roshless/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
makedepends=('meson')
depends=('glibc')
optdepends=(
    'mpv: play timer sound'
    'mplayer: alternative player for timer'
    'gtk4: alternative GTK gui'
)

build() {
	arch-meson $pkgname-$pkgver build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}

sha512sums=('1a01f8b555c402f8f285e9b3580bbacea77a89e3807b508432558fed1459bf0845ce6d6cdb378dfd1c579020a6e7dd40edb6e79f680324bdc1904eb6b671cf89')
