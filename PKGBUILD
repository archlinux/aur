# Maintainer: duffydack <duffydack73 {at] gmail {dot} com>

pkgname=gifsicle-lossy
_pkgname=giflossy
pkgver=1.82.1
pkgrel=1
pkgdesc="Based on gifsicle which implements lossy LZW compression.  It can reduce animgif file sizes 30%—50% at a cost of some dithering/noise."
arch=('i686' 'x86_64')
url="https://github.com/pornel/${_pkgname}"
license=('GPL2')
depends=('libx11')
makedepends=('git')
provides=('gifsicle')
conflicts=('gifsicle')
source=(${_pkgname}::"git+https://github.com/pornel/${_pkgname}.git")
md5sums=('SKIP')

build() {
        cd "$srcdir/$_pkgname"
        autoreconf -i
	./configure --prefix=/usr
        make
}

package() {
        cd "$srcdir/$_pkgname"
        make DESTDIR="$pkgdir/" install
}

