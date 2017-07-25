pkgname=bellepoule
pkgver=4.36
pkgrel=1
pkgdesc="Fencing tournament management software"
arch=('i686' 'x86_64')
url="http://betton.escrime.free.fr/fencing-tournament-software/en/bellepoule/index.html"
license=('GPL3')
depends=('gtk2>=2.24.0' 'xml2' 'curl' 'libmicrohttpd' 'goocanvas1' 'qrencode' 'openssl' 'lighttpd' 'php-cgi' 'gksu')
source=("https://launchpad.net/~betonniere/+archive/ubuntu/bellepoule/+files/${pkgname}_${pkgver}ubuntu1~xenial1.tar.gz")
sha256sums=('0557cfc5a09a503b1b22215bb72613b0483f6468e6a04d4498a8c10b402ef4e3')

build() {
    cd "${pkgname}_${pkgver}"
    make
}

package() {
    cd "${pkgname}_${pkgver}"
    make DESTDIR="$pkgdir/" install
}
