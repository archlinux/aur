
# Maintainer: Aryan Ghasemi <aryangh1379@gmail.com>
pkgname=bunster
pkgver=0.13.0
pkgrel=1
pkgdesc="Compile shell scripts to static binaries."
arch=('any')
url="https://github.com/yassinebenaid/bunster"
license=('BSD-3-Clause')
makedepends=('go')
conflicts=('bunster-bin')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('65ae0de089da9ae7166ff608a9eedbdb42eab5abfbfab347fed58cb5466fa7e2')

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
