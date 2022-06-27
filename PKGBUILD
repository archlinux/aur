# Maintainer: BlitDev <blitdevan@proton.me>
pkgname=reactgame
pkgver=1.3.1
pkgrel=1
pkgdesc="A simple reaction training game written in C# (.NET 6.0)"
url="https://codeberg.org/BlitDev/ReactGame"
arch=("x86_64")
license=("GPL3")
depends=("git" "dotnet-runtime")
makedepends=("dotnet-sdk")
source=("${url}/archive/${pkgver}.tar.gz")
options=(!strip)
sha256sums=('33807eff2b2f3ba94762d93c729d4b9c603f7d4025827a75c92fc1068f0dece4')

build() {
	cd "$srcdir/reactgame"
	make --always-make publish
}

package() {
	cd "$srcdir/reactgame"
	make install DESTDIR="$pkgdir/usr/bin"
}
