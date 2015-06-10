# Maintainer: Oliver Jaksch <ojaksch _at_ com-in dot de>
# Contributor: Oliver Jaksch <ojaksch _at_ com-in dot de>
# Contributor: Oliver Jaksch <ojaksch _at_ com-in dot de>

pkgname=prog-express
pkgver=3.7.3
pkgrel=1
pkgdesc="Prog-Express is a modern, intuitive and free control software for the Batronix USB programming devices"
arch=('i686' 'x86_64')
url="http://www.batronix.com/"
license=('custom:Freeware')
depends=('xz' 'libarchive' 'mono' 'mono-basic' 'libusb' 'sqlite' 'libgdiplus')

source_i686=(${url}/exe/Batronix/Prog-Express/deb/${pkgname}-${pkgver}-${pkgrel}.i386.deb)
source_x86_64=(${url}/exe/Batronix/Prog-Express/deb/${pkgname}-${pkgver}-${pkgrel}.amd64.deb)

sha256sums_i686=('365a9bf42a9ac4f0af531da0ea5bbc56ce9e407afd96b9ecbc8d37929a7d93fe')
sha256sums_x86_64=('8337b7afa96442a62af4ea46d7c58f031aa41d9886abb8a6b8bda96da2d23c5a')

package() {
    cd "$pkgdir"
    tar xf $srcdir/data.tar.xz
    cp -r lib/* usr/lib/
    cp -r usr/sbin/* usr/bin/
    rm -rf lib/ usr/sbin/
}
