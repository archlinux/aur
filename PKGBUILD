# Maintainer: wallace < str(11) + my_id at gmail dot com>

pkgname=fontfor
pkgver=0.3.1
pkgrel=2
pkgdesc="Find fonts which can show a specified character and preview them in terminal or browser."
arch=('x86_64')
url=https://github.com/7sDream/fontfor
license=('GPL-3.0')
depends=()
makedepends=('rust' 'cmake' 'freetype2')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('0e7969de5a6313d6b8a11a16f07c607ba9c82c26dfa0ddecff08c153e000801e')

build() {
    cd $pkgname-$pkgver
    cargo build --release --locked
}

package() {
    cd $pkgname-$pkgver
    install -Dt "$pkgdir"/usr/bin target/release/$pkgname
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
