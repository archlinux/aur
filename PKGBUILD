# Maintainer: Jozef Riha <jose1711 at gmail dot com>
# Contributor: Junker

pkgname=gvolwheel
pkgver=1.0.2
pkgrel=1
pkgdesc="a lightweight audio mixer which lets you control the audio volume through a tray icon"
url="https://github.com/Junker/gvolwheel"
arch=('i686' 'x86_64')
license=('GPL-2')
makedepends=('intltool')
depends=('gtk3' 'libgee')
source=("https://github.com/Junker/${pkgname}/archive/${pkgver}.zip")
md5sums=('2bfde9ec2d9f288531626c1688c6b025')

build() {
    cd $srcdir/${pkgname}-$pkgver
    ./autogen.sh --prefix=/usr
    ./configure --prefix=/usr
    make
}

package() {
    cd $srcdir/${pkgname}-$pkgver
    make DESTDIR="$pkgdir" install
}
