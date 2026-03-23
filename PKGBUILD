# Maintainer: Soupy Boy <aur@bonking.im>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Antoine POPINEAU <antoine at popineau dot eu>

pkgname=greetd-tuigreet-fork-bin
pkgver=0.10.2
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
sha256sums=('610bb9fad02778336521573743ddbaadf9f8279ea262c7dd8bca05b70eef8812'
            '2122590fff71bad80dc334f59a430e07afb374864e223e13cb9ace8087bcde99'
            '7fcc75e94cd2e1defa10792e74edf102395182c66add45b26822efcb14e90472'
            '32723fcd603621ec301f98c743315e8461bfb0e67670d1373a76e5b54c322473'
            '8f83aee7874aab5d06981a1d1cd05df906368a79dbca90d157a33a2f023b67d3')

package() {
	depends=(gcc-libs greetd)

	install -Dm755 "${srcdir}/tuigreet-${pkgver}-x86_64" "${pkgdir}/usr/bin/tuigreet"

	install -Dm644 "${srcdir}/tuigreet.conf" "${pkgdir}/usr/lib/tmpfiles.d/tuigreet.conf"
}

