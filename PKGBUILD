pkgname=nikki-editor
pkgver=0.2.1
pkgrel=1
pkgdesc="Simple terminal-based text editor written in C"
arch=('x86_64')
url="https://github.com/nijat19trying/nikki-editor"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('778300d57c37de62b6ee1fd02570fdf5f1911a81e24647666b5bd0d8377392aa')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}

