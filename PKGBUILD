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

sha512sums=('568988cf0717b1e435452785f53c9ba2880d34055eba7be91b4767d5acd91d2b94dfa8fceacf3d228f6dc58fe96fd6eca1da120fa301734c4d54eef343254282')
