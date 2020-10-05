# Maintainer: tjbp (archlinux@tjbp.net)
# Contributor: Alexander R?dseth <rodseth@gmail.com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: tardo <tardo@nagi-fanboi.net>

pkgname=chuck-jack
pkgver=1.4.0.1
pkgrel=1
pkgdesc='Concurrent, on-the-fly audio programming language'
arch=('x86_64' 'i686')
url='http://chuck.cs.princeton.edu/'
license=('GPL')
depends=('gcc-libs' 'libsndfile')
conflicts=('chuck')
provides=('chuck')
source=("http://chuck.cs.princeton.edu/release/files/chuck-$pkgver.tgz")
sha256sums=('11a20c34b385e132bf43d5ae6a562c652f631828cc6b1562a4c029bc9a850ed4')

build() {
    make -C "chuck-$pkgver/src" linux-jack
}

package() {
    cd "chuck-$pkgver/src"

    install -Dm755 "chuck" "$pkgdir/usr/bin/chuck"
    install -d "$pkgdir/usr/share/doc/chuck"
    cp -r ../examples "$pkgdir/usr/share/doc/chuck"
}
