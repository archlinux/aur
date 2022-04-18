# Maintainer: BlitDev <blitgaming1007@mail.ru>
pkgname=reactgame
pkgver=1.3.0
pkgrel=3
pkgdesc="A simple reaction training game written in C# (.NET 6.0)"
url="https://codeberg.org/BlitDev/ReactGame"
arch=("x86_64")
license=("GPL3")
depends=("git" "dotnet-sdk")
source=("${url}/archive/${pkgver}.tar.gz")
options=(!strip)
sha256sums=('ad2a40fbd7e66593e6011f3e22ee98a6cdb24cee4513f8f16decd4e36413d98f')

build() {
	cd "$srcdir/reactgame"
	make --always-make publish
}

package() {
	cd "$srcdir/reactgame"
	make install DESTDIR="$pkgdir/usr/bin"
}
