pkgname=bellepoule
pkgver=4.44
pkgrel=1
pkgdesc="Fencing tournament management software"
arch=('i686' 'x86_64')
url="http://betton.escrime.free.fr/fencing-tournament-software/en/bellepoule/index.html"
license=('GPL3')
depends=('gtk2>=2.24.0' 'xml2' 'curl' 'libmicrohttpd' 'goocanvas1' 'qrencode' 'openssl' 'lighttpd' 'php-cgi' 'gksu')
source=("https://launchpad.net/~betonniere/+archive/ubuntu/bellepoule/+files/${pkgname}_${pkgver}ubuntu1~xenial1.tar.gz")
sha256sums=('0c337138bf16a7d3297ce081be329bd1c9dcb7fab9e7ed75f62cdb6ac5dda6db')

build() {
    cd "${pkgname}_${pkgver}"
    make
}

package() {
    cd "${pkgname}_${pkgver}"
    make DESTDIR="$pkgdir/" install
}
