# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
pkgname=omnisharp-roslyn-bin
pkgver=1.39.5
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
sha256sums=('4ba13243613116effaf28bd6f0157c5eddf76477e063242bbd7075fcd9caab74')

package() {
	install -Dm755 OmniSharp *.dll -t"$pkgdir"/usr/lib/omnisharp
	install -Dm644 *.json          -t"$pkgdir"/usr/lib/omnisharp
	install -dm755                   "$pkgdir"/usr/bin
	ln -s ../lib/omnisharp/OmniSharp "$pkgdir"/usr/bin/omnisharp
	install -Dm644 license.md        "$pkgdir"/usr/share/licenses/$pkgname/license.md
}
