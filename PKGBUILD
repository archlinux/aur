# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
pkgname=omnisharp-roslyn-bin
pkgver=1.39.12
pkgrel=1
pkgdesc='OmniSharp server (STDIO) based on Roslyn workspaces'
arch=(x86_64)
url='https://github.com/OmniSharp/omnisharp-roslyn'
license=(MIT)
depends=(dotnet-sdk)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
source=(
	"omnisharp-linux-x64-net6.0-$pkgver.tar.gz::https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v$pkgver/omnisharp-linux-x64-net6.0.tar.gz"
)
sha256sums=('e6496db73f44005b6c750d5f2da7d752edd181cde7e07062944da81695428f65')

package() {
	install -Dm755 OmniSharp *.dll -t"$pkgdir"/usr/lib/omnisharp
	install -Dm644 *.json          -t"$pkgdir"/usr/lib/omnisharp
	install -dm755                   "$pkgdir"/usr/bin
	ln -s ../lib/omnisharp/OmniSharp "$pkgdir"/usr/bin/omnisharp
	install -Dm644 license.md        "$pkgdir"/usr/share/licenses/$pkgname/license.md
}
