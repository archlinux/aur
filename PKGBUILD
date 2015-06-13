# Maintainer: Viacheslav Chimishuk <vchimishuk@yandex.ru>
# Contributors: Volodymyr Medvid <vmedvid@riseup.net>

pkgname=kbdd
pkgver=0.7
pkgrel=3
pkgdesc="Simple daemon and library to make per window layout."
arch=('i686' 'x86_64')
url="https://github.com/qnikst/kbdd"
license=('GPL3')
depends=('libx11' 'dbus-glib')
source=("https://github.com/qnikst/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('0d8abb1d70c2dd43c041ecafd8324133')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    aclocal
    automake --add-missing || echo "Automake errors ignored"
    autoreconf
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
