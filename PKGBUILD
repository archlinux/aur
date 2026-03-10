# Maintainer: Soupy Boy <aur@bonking.im>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Antoine POPINEAU <antoine at popineau dot eu>

pkgname=greetd-tuigreet-soupy-boy-bin
pkgver=1.0.0
pkgrel=2

pkgdesc='A console UI greeter for greetd'
url="https://github.com/soupy-boy/tuigreet"
license=(GPL3)
conflicts=(greetd-tuigreet greetd-tuigreet-git greetd-tuigreet-soupy-boy-git)

arch=(x86_64)

source=("$url/releases/download/$pkgver/tuigreet-$pkgver-x86_64"
        'tuigreet.conf')
sha256sums=('b151e52a3844d823fd28a08cc9ae17bfa90a046b9d2aa9b3c60cb91b0fbcc807'
            '8f83aee7874aab5d06981a1d1cd05df906368a79dbca90d157a33a2f023b67d3')

package() {
	depends=(gcc-libs greetd)

	install -Dm755 "${srcdir}/tuigreet-${pkgver}-x86_64" "${pkgdir}/usr/bin/tuigreet"

	install -Dm644 "${srcdir}/tuigreet.conf" "${pkgdir}/usr/lib/tmpfiles.d/tuigreet.conf"
}

