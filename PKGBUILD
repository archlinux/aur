# Maintainer: Noah Vogt <noah@noahvogt.com>
pkgname=tibasicc
pkgver=1.2
pkgrel=1
pkgdesc="TI-BASIC (de-)compiler written in C++ with a decent preprocessor"
arch=("x86_64")
url="https://github.com/noahvogt/tibasicc.git"
license=('ISC')
provides=(tibasicc)
conflicts=(tibasicc)
source=(https://github.com/noahvogt/$pkgname/releases/download/v$pkgver/$pkgname
        https://github.com/noahvogt/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('47e9340cf62661079aef554901c80470ed8e0267a0904cf9cb905b295ce72135'
            '6eab541b7e31749d2406fff0f16c28fe503695540cb8296c3574f4c23c9e8aae')

package() {
    install -Dm755 "$pkgname" "$pkgdir"

	cd "$pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    cd doc/tixx_guide
    mkdir -p "$pkgdir/usr/share/doc/$pkgname/linkguide"
    cp -rf * "$pkgdir/usr/share/doc/$pkgname"
}
