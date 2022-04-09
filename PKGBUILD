# Maintainer: BlitGaming <blitgaming1007@mail.ru>
pkgname=reactgame
pkgver=1.3.0
pkgrel=2
pkgdesc="A simple reaction training game written in C# (.NET 6.0)"
url="https://github.com/BlitDev/ReactGame"
arch=("x86_64")
license=("GPL3")
depends=("git" "dotnet-sdk")
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
options=(!strip)
sha256sums=('3a1978069e67f947ffb8143e630f75e202b40824a7d566dddd1993f04d5d883a')

build() {
	cd "$srcdir"
	bsdtar -xzvf "${pkgver}.tar.gz"
	cd "$srcdir/ReactGame-${pkgver}"
	make publish
}

package() {
	cd "$srcdir/ReactGame-${pkgver}"
	make install DESTDIR="$pkgdir/usr/bin"
}
