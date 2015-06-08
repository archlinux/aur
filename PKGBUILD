# Maintainer: Alessandro Pazzaglia <jackdroido at gmail dot com>

pkgname=ftpcopy
pkgver=0.6.7
pkgrel=1
pkgdesc="A simple FTP client to copy files recursively from an FTP server"
arch=('i686' 'x86_64')
url="http://ohse.de/uwe/ftpcopy.html"
license=('GPL2')
source=(
    "http://www.ohse.de/uwe/ftpcopy/${pkgname}-${pkgver}.tar.gz"
)
md5sums=(
    '78d5245970803230f0f22f0f040a58ef'
)

build() {
    cd "$srcdir/web/${pkgname}-${pkgver}"

    msg "Starting make ..."

    make
}

package() {
    cd "$srcdir/web/${pkgname}-${pkgver}"

    install -d -m 755 "${pkgdir}/usr/bin"
    install -d -m 755 "${pkgdir}/usr/share/man/man1"

    cp command/ftp* "${pkgdir}/usr/bin"
    cp doc/*.1 "${pkgdir}/usr/share/man/man1"
}
