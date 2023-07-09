# Contributor: Asuka Minato

pkgname=boa-bin
pkgver=0.17
pkgrel=1
pkgdesc="an embeddable and experimental Javascript engine written in Rust. Currently, it has support for some of the language."
arch=(x86_64)
url="https://github.com/boa-dev/boa"
license=('MIT')
depends=(glibc gcc-libs)
provides=(boa)
conflicts=(boa-git)
source=("$pkgname-$pkgver::https://github.com/boa-dev/boa/releases/download/v$pkgver/boa-linux-amd64"
	"https://raw.githubusercontent.com/boa-dev/boa/main/LICENSE-MIT"
	"https://raw.githubusercontent.com/boa-dev/boa/main/LICENSE-UNLICENSE"
)
sha256sums=(7240103a41b2b3fc45712eae4ea48663caa79be86548e912a1e290eb1e68895c
	60d7cf4b66cef6bab24701e25f87829c4ce01fb734def53c41e5ed79ab434cb3
	88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd
)

package() {
	install -Dm755 $srcdir/boa* $pkgdir/usr/bin/boa
	install -Dm644 $srcdir/LICENSE* -t $pkgdir/usr/share/licenses/$pkgname/
}
