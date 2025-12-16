pkgname=rotorix-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Rotor-based encryption CLI inspired by the Enigma machine"
arch=("x86_64")
url="https://github.com/umpire274/rotorix"
license=("MIT")
provides=("rotorix")
conflicts=("rotorix")

source=(
	"rotorix-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/umpire274/rotorix/releases/download/rotorix-v${pkgver}/rotorix-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)

sha256sums=(
	"d833202a2d8e82ffe61b7780049f3e17551f0a3a78bc0388da274f32bf1efeea"
)

package() {
	tar xf "rotorix-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
	cd "rotorix-${pkgver}-x86_64-unknown-linux-gnu"

	install -Dm755 rotorix "${pkgdir}/usr/bin/rotorix"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/rotorix/README.md"
	install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/rotorix/CHANGELOG.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/rotorix/LICENSE"
}
