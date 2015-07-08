# Maintainer:  Giovanni Santini "ItachiSan" <giovannisantini93@yahoo.it>
# Previous maintainer:  agnotek <agnostic.sn [at]gmail.com>
# Contributor: agnotek <agnostic.sn [at]gmail.com>

pkgname=telegram-desktop-bin
pkgver=0.8.38
pkgrel=2
pkgdesc="Official desktop version of Telegram messaging app."
arch=('i686' 'x86_64')
url="https://desktop.telegram.org"
license=('GPL3')
depends=('libx11' 'libgcrypt' 'libasyncns' 'libsndfile' 'libsystemd' 'libdbus' 'openal' 'libogg' 'opus' 'opusfile' 'portaudio' 'openssl' 'zlib' 'libexif' 'xz')
conflicts=('telegram-dev')
replaces=('telegram-bin')
install="$pkgname.install"

# Sources
source=('telegram')
source_i686=('https://updates.tdesktop.com/tlinux32/tsetup32.'$pkgver'.tar.xz')
source_x86_64=('https://updates.tdesktop.com/tlinux/tsetup.'$pkgver'.tar.xz')
# Checksums
sha256sums=('0f2a6e4c2b9b4ff5f4ddb628728be4cc5a419f79695c0151321a5f234099ee59')
sha256sums_i686=('1cd1337c5e7cdf235bae06f14d51fd5b9ef17f0bba424258d31c111f1f70d836')
sha256sums_x86_64=('5b7b15ab555275beda47a198c34baee97cfadc3d88feb664a01aa342ad603ba0')

package() {

	cd "$srcdir/"

	install -dm755 "$pkgdir/opt/telegram/"
	install -dm755 "$pkgdir/usr/bin"

	# Program
	install -Dm755 "$srcdir/Telegram/Telegram" "$pkgdir/opt/telegram/"
	install -Dm755 "$srcdir/Telegram/Updater" "$pkgdir/opt/telegram/"

	# Shell wrapper
	install -Dm755 "$srcdir/telegram" "$pkgdir/usr/bin"

}

