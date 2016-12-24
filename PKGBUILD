# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=genhupo
pkgver=0.0.1
pkgrel=2
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

sha512sums=('6bf9b18f5db479a95bd10cd9f4aedf153d29250842aa81fcb1008ca0f658369a57c8dc6743d813911e2513c59af2fc780c38f383272634db7fb48d68f387eb07')
