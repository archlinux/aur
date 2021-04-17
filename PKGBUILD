# Maintainer: Frank Seifferth <frankseifferth@posteo.net>
pkgname=editorconfig-core-lua
conflicts=('editorconfig-core-lua-git')
pkgver=0.3.0
pkgrel=2
pkgdesc="EditorConfig Core bindings for Lua"
arch=('any')
url="https://github.com/editorconfig/editorconfig-core-lua"
license=('custom:BSD')
depends=('lua' 'editorconfig-core-c')
makedepends=('cmake')
source=("https://github.com/editorconfig/editorconfig-core-lua/archive/v$pkgver.tar.gz")
md5sums=('b4f5d8c7e83f200e15f4de2b65845023')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake .
    make
}

package() {
    install -Dm 755 "$srcdir/$pkgname-$pkgver/editorconfig.so" \
                    "$pkgdir/usr/lib/lua/5.4/editorconfig.so"
    install -Dm 644 "$srcdir/$pkgname-$pkgver/LICENSE" \
                    "$pkgdir/usr/share/licenses/editorconfig-core-lua/LICENSE"
}
