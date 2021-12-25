# Maintainer: BlitGaming <blitgaming1007@mail.ru>
pkgname=reactgame
pkgver=1.0.0
pkgrel=2
pkgdesc="A simple reaction training game written in C# (.NET 6.0)"
url="https://github.com/BlitGaming/ReactGame"
arch=("x86_64")
license=("GPL3")
depends=("git" "dotnet-sdk")
source=("git+https://github.com/BlitGaming/ReactGame.git")
options=(!strip)
sha256sums=("SKIP")

build() {
	cd "$srcdir/ReactGame"
	make publish
}

package() {
	cd "$srcdir/ReactGame"
	make install DESTDIR="$pkgdir/usr/bin"
}
