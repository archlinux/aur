# Maintainer: Ilya Fedin <ilya-fedin@outlook.com>

pkgname=libtgvoip
pkgver=2.4.4
pkgrel=1
pkgdesc="VoIP library for Telegram clients"
arch=(x86_64)
url="https://github.com/telegramdesktop/libtgvoip"
license=(Unlicense)
depends=(openssl opus)
optdepends=(
	'alsa-lib: for alsa support'
	'libpulse: for pulseaudio support'
)
_commit="4dabb67eff8756e1ee0ad6e27a0a0478ea65b6d4"
source=("https://github.com/telegramdesktop/libtgvoip/archive/${_commit}.zip")

sha512sums=('befefbc7c7386423c0db3e049ad5406f3686d2cfbd35fc83ed9b72f9347fcd0c8187fc765595379cd81fcf47f46798377a8975c2e1c3231907a82ee684dd27da')

build() {
	cd "$srcdir/$pkgname-${_commit}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-${_commit}"
	make DESTDIR="$pkgdir" install
}
