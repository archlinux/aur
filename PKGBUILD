# Maintainer: Wasabi <wasabithumbs@gmail.com>
_name="justin"
pkgname="${_name}-bin"
pkgver="0.0.1"
pkgrel=2
pkgdesc="A minimal AUR helper written in C with support for installation of legacy versions. Pre-compiled."
arch=('any')
url="https://github.com/WasabiThumb/justin"
license=('Apache-2.0')
depends=('sudo' 'libgit2' 'curl' 'pacman' 'json-c')
makedepends=()
source=("https://github.com/WasabiThumb/justin/releases/download/${pkgver}/justin" "https://raw.githubusercontent.com/WasabiThumb/justin/${pkgver}/LICENSE.txt" "https://raw.githubusercontent.com/WasabiThumb/justin/${pkgver}/README.md")
md5sums=("bb371d120fa7623bb69b90e11d206a4d" "2ee41112a44fe7014dce33e26468ba93" "SKIP")
options=(!strip)
provides=("${_name}")
conflicts=("${_name}")

package() {
	cd "$srcdir"
	install -Dm 755 "$srcdir/justin" "$pkgdir/usr/bin/justin"
	install -Dm 644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname"
	install -Dm 644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}

# build () {
# 	cd "$srcdir/$pkgname-$pkgver"
# 	cmake -G "Unix Makefiles" -B ./build -DCMAKE_BUILD_TYPE=Release
# 	cd build && make
# }

# package() {
# 	cd "$srcdir/$pkgname-$pkgver/build"
# 	install -Dm 755 "$srcdir/$pkgname-$pkgver/build/justin" "$pkgdir/usr/bin/justin"
# 	install -Dm 644 "$srcdir/$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname"
# 	install -Dm 644 "$srcdir/$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
# }