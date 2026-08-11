# Maintainer: Hugo ARNAL <aur at hugoarnal dot com>

pkgname=gigot
pkgver=0.2.0
pkgrel=1
pkgdesc="An easy gitconfig switcher"
url="https://github.com/hugoarnal/gigot"
license=("GPL-3.0-or-later")
arch=("x86_64")
makedepends=("go")
provides=("$pkgname")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('ea47b8f097073b1e3f93c88f69ebc8b8fa348394edb10382b3db495a33b3fc79')

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
