# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=genhupo
pkgver=0.0.1
pkgrel=1
pkgdesc="Create ramdom file with lipsum for hugo"
arch=('any')
url="https://github.com/Chipsterjulien/genhupo"
license=('WTFPL')
makedepends=('go')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz")

_builddir="$pkgname-$pkgver"

build() {
    cd "$_builddir"
    
    go build || return 1
}

package() {
    cd "$_builddir"

    # pingormail binary
    install -m755 -o root -g root -D "$srcdir"/$pkgname-$pkgver/$pkgname-$pkgver \
        "$pkgdir"/usr/bin/$pkgname || return 1
}

sha512sums=('08aa5c7bad8b1cd75f37611d3d612d96aae4122e289479f23c5dac569b875df9df8bfa4e5e03dc8407b40f6d9eadeba60d978641763dd7301d0229e75fadfdf7')
