# Maintainer: Ilya Fedin <ilya-fedin@outlook.com>

pkgname=libtgvoip
pkgver=2.4.4
pkgrel=2
pkgdesc="VoIP library for Telegram clients"
arch=(x86_64)
url="https://github.com/telegramdesktop/libtgvoip"
license=(Unlicense)
depends=(openssl opus)
optdepends=(
	'alsa-lib: for alsa support'
	'libpulse: for pulseaudio support'
)
_commit="303dcacc2ad0428fd165c71455056d3f8f884d6f"
source=("https://github.com/telegramdesktop/libtgvoip/archive/${_commit}.zip")

sha512sums=('f369a99fc8cc39a6b62c81fa8513bfe187d3c91a747cd12fee0dfddec6ef26eac6c24b124e4212304796e679286cf5eaa303a731620a08e230a5f0ded71857b9')

build() {
	cd "$srcdir/$pkgname-${_commit}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-${_commit}"
	make DESTDIR="$pkgdir" install
}
