# Maintainer: Soupy Boy <aur@bonking.im>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Antoine POPINEAU <antoine at popineau dot eu>

pkgname=greetd-tuigreet-fork-bin
pkgver=0.10.0
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
sha256sums=('6771f743995d6290a4e7ca788a9ca098a4c29f1461f69a9d8b9c8b08a0739fe9'
            '8a95bb3461148613e9a9537e6287b5069de4c3fcc3368050dd6f49a2fe0f72b4'
            '36a08677eead337495be11393afc82f289f450c60902ed76c9a82d1ee2eab20a'
            '39d9d826545d0648795c6cab5145da5ffbb324e4991d43449710021e0f421431'
            '8f83aee7874aab5d06981a1d1cd05df906368a79dbca90d157a33a2f023b67d3')

package() {
	depends=(gcc-libs greetd)

	install -Dm755 "${srcdir}/tuigreet-${pkgver}-x86_64" "${pkgdir}/usr/bin/tuigreet"

	install -Dm644 "${srcdir}/tuigreet.conf" "${pkgdir}/usr/lib/tmpfiles.d/tuigreet.conf"
}

