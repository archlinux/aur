
# Maintainer: Aryan Ghasemi <aryangh1379@gmail.com>
pkgname=bunster
pkgver=0.7.1
pkgrel=1
pkgdesc="Compile shell scripts to static binaries."
arch=('any')
url="https://github.com/yassinebenaid/bunster"
license=('BSD-3-Clause')
makedepends=('go')
conflicts=('bunster-bin')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5543a988e747abe3984ce8491656f2806de3c25fa527c12fdf82cc40b6b654cd')

build() {
    cd "$srcdir"
	cd "$pkgname-$pkgver"
    make build
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm755 "./bin/bunster" "${pkgdir}/usr/bin/bunster"
    install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/bunster/LICENSE"
}
