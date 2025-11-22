# Maintainer: tjbp (archlinux@tjbp.net)

pkgname=itsa
pkgver=002
pkgrel=1
pkgdesc='itsa is a program for interacting with the UK’s HMRC Make Tax Digital APIs'
arch=('x86_64' 'i686')
url='https://github.com/ac000/itsa'
license=('GPL-2.0-only')
depends=('sqlite' 'libac' 'libmtdac')
source=("https://github.com/ac000/itsa/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41b0c82e5ddcf706d4bbcb6ae4b82f99cdc2ddef6c83af359e80932f3842deb1')

build() {
    cd itsa-$pkgver
    make
}

package() {
    cd itsa-$pkgver

    install -Dp -m0755 src/itsa $pkgdir/usr/bin/itsa
}
