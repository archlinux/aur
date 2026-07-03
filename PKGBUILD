# Maintainer: Hugo ARNAL <aur at hugoarnal dot com>

pkgname=gigot
pkgver=0.1.1
pkgrel=1
pkgdesc="An easy gitconfig switcher"
url="https://github.com/hugoarnal/gigot"
license=("GPL-3.0-or-later")
arch=("x86_64")
makedepends=("go")
provides=("$pkgname")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('510710cb7fc4d64b2f4fc50a7a569d74cb022efbcfe1427397fcfcf4a47b339f')

build() {
	cd "$srcdir/$pkgname-$pkgver"
    go build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 gigot "$pkgdir/usr/bin/gigot"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
