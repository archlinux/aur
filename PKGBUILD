# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=spoofer
pkgver=1.0.5
pkgrel=1
pkgdesc="client software for the spoofer internet research project on ip spoofing"
url="https://spoofer.caida.org"
arch=('x86_64' 'i686')
license=('GPL3')
depends=("libpcap" "protobuf" "qt5-base")
source=("https://www.caida.org/projects/spoofer/downloads/spoofer-1.0.5.tar.gz")
sha1sums=('7a9a497181bc7bcbab9276a0e741040075d92b15')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure
    make
}
 
package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install 
    mv "$pkgdir/usr/local/bin" "$pkgdir/usr/"
    rmdir "$pkgdir/usr/local"
}
