# Maintainer: Soupy Boy <aur@bonking.im>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Antoine POPINEAU <antoine at popineau dot eu>

pkgname=greetd-tuigreet-fork-bin
pkgver=0.10.1
pkgrel=1

pkgdesc='Stylish graphical console greeter for greetd, built with Ratatui'
url="https://github.com/NotAShelf/tuigreet"
license=('GPL-3.0-only')
conflicts=(greetd-tuigreet greetd-tuigreet-git greetd-tuigreet-fork-git)

arch=(x86_64 i686 armv7 aarch64)

source=("$url/releases/download/$pkgver/tuigreet-$pkgver-x86_64"
	"$url/releases/download/$pkgver/tuigreet-$pkgver-i686"
	"$url/releases/download/$pkgver/tuigreet-$pkgver-armv7"
	"$url/releases/download/$pkgver/tuigreet-$pkgver-aarch64"
        'tuigreet.conf')
sha256sums=('6b2b5feb598d15caebb524cc4f2f8c5df9f023acdf69314d06beca10f8d7db8c'
            '828d4d5ac1294a536c6afdfc77aebadc4dbe44c18c65e0f9fa8e241c7858ed44'
            '90fb4a5706a10fdd706d14b86be872976f6291c718f4883f6880faf8b42c142d'
            '1ef60b8c7cc8224f2910a08c9a7f6e92eb436bcc159c8f4fb098f8c4348b9a5d'
            '8f83aee7874aab5d06981a1d1cd05df906368a79dbca90d157a33a2f023b67d3')

package() {
	depends=(gcc-libs greetd)

	install -Dm755 "${srcdir}/tuigreet-${pkgver}-x86_64" "${pkgdir}/usr/bin/tuigreet"

	install -Dm644 "${srcdir}/tuigreet.conf" "${pkgdir}/usr/lib/tmpfiles.d/tuigreet.conf"
}

