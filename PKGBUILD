# Maintainer:  Giovanni Santini "ItachiSan" <giovannisantini93@yahoo.it>
# Previous maintainer:  agnotek <agnostic.sn [at]gmail.com>
# Contributor: agnotek <agnostic.sn [at]gmail.com>

pkgname=telegram-desktop-bin
pkgver=0.9.44
pkgrel=3
pkgdesc="Official desktop version of Telegram messaging app - Static binaries"
arch=('i686' 'x86_64')
url="https://desktop.telegram.org"
license=('GPL3')
depends=(
	'glib2'
	'libx11'
)
optdepends=(
			'libappindicator-gtk2: to hide Telegram in the tray bar (GTK2-based desktop environment)'
			'libappindicator-gtk3: to hide Telegram in the tray bar (GTK3-based desktop environment)'
			'libappindicator-sharp: to hide Telegram in the tray bar (Unity-based desktop environment)'
			)
conflicts=('telegram-desktop')
provides=('telegram-desktop')
replaces=('telegram-bin')

# Sources
source=(
	"$pkgname.desktop"
	"$pkgname.png"
)
source_i686=('https://updates.tdesktop.com/tlinux32/tsetup32.'$pkgver'.tar.xz')
source_x86_64=('https://updates.tdesktop.com/tlinux/tsetup.'$pkgver'.tar.xz')
# Checksums
sha256sums=('32d1597d67a7ef519367e499fcc978da4cce104e370b3787853446d93b1533d6'
            '4226167b476a75e844ddf0d429068e7e901bbde516810a7d4ca90f8405c01eef')
sha256sums_i686=('6af4e802a59874c504b8a504b7b1c5f71454b5537e9955c0ab17f8af7882bbb1')
sha256sums_x86_64=('866acd224c04f3a51bff8b347a49d902f536a93214a8a9658fb7746aa3ddba5d')
# Some installation information
install="$pkgname.install"

package() {

	cd "$srcdir/"

	# Creating needed directories
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"

	# Program
	install -Dm755 "$srcdir/Telegram/Telegram" "$pkgdir/usr/bin/telegram-desktop"

	# Desktop launcher
	install -Dm755 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/telegram.png"
	install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/telegramdesktop.desktop"
}
