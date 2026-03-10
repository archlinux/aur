# Maintainer: Soupy Boy <aur@bonking.im>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Antoine POPINEAU <antoine at popineau dot eu>

pkgname=greetd-tuigreet-soupy-boy-bin
pkgver=1.0.1
pkgrel=2

pkgdesc='A console UI greeter for greetd'
url="https://github.com/soupy-boy/tuigreet"
license=(GPL3)
conflicts=(greetd-tuigreet greetd-tuigreet-git greetd-tuigreet-soupy-boy-git)

arch=(x86_64 i686 armv7 aarch64)

source=("$url/releases/download/$pkgver/tuigreet-$pkgver-x86_64"
	"$url/releases/download/$pkgver/tuigreet-$pkgver-i686"
	"$url/releases/download/$pkgver/tuigreet-$pkgver-armv7"
	"$url/releases/download/$pkgver/tuigreet-$pkgver-aarch64"
        'tuigreet.conf')
sha256sums=('1239acdeacad6eb55eb9a1c7cec0c40ae6da5e465ee1f576b60df7bd9e0f69d1'
            '93b490a7cd89aa246a60042d55ca454063525964dfca62f7d22c8562a5d400cc'
            'd6078e4f1f95bcf73ed99b5f4c328eb214692dec7efdba1150d5cb158a2e426b'
            'cac7abbbc2937426621d093b27eb94c2b346de3dc11e5c2e1bceb4518ef7dcb7'
            '8f83aee7874aab5d06981a1d1cd05df906368a79dbca90d157a33a2f023b67d3')

package() {
	depends=(gcc-libs greetd)

	install -Dm755 "${srcdir}/tuigreet-${pkgver}-x86_64" "${pkgdir}/usr/bin/tuigreet"

	install -Dm644 "${srcdir}/tuigreet.conf" "${pkgdir}/usr/lib/tmpfiles.d/tuigreet.conf"
}

