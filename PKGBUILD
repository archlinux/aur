# Maintainer: hexchain <arch at hexchain.org>

pkgname=krunvm
pkgver=0.2.3
pkgrel=1
pkgdesc="Create microVMs from OCI images"
url='https://github.com/containers/krunvm'
arch=('x86_64')
license=('Apache')
makedepends=('cargo' 'asciidoctor')
depends=('glibc' 'gcc-libs' 'libkrun' 'buildah')
source=("https://github.com/containers/krunvm/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
sha256sums=('b290bcb70f341ac4814b0eb0e3a19084c301135f61e49f406168157b0d5f74c4')
