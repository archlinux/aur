# Maintainer: Viacheslav Chimishuk <vchimishuk@yandex.ru>
# Contributors: Volodymyr Medvid <vmedvid@riseup.net>

pkgname=kbdd-git
pkgver=47dee02
pkgrel=1
pkgdesc="Simple daemon and library to make per window layout"
arch=('i686' 'x86_64')
url="https://github.com/qnikst/kbdd"
license=('GPL3')
makedepends=('git' 'automake' 'autoconf')
depends=('libx11' 'dbus-glib')
source=("git://github.com/qnikst/kbdd")
md5sums=('SKIP')

build() {
    cd "${srcdir}/kbdd"
    aclocal
    automake --add-missing || echo "Automake errors ignored"
    autoreconf
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/kbdd"
    make DESTDIR="${pkgdir}" install
}
