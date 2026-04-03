# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=librcd
_pkgname=librcd-debian
pkgver=0.1.14
_pkgver=0.1.14-2
pkgrel=4
pkgdesc="Charset Detection Library"
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/rusxmms/librcd'
license=('LGPL-2.1-only')
depends=('glibc')
provides=("$pkgname.so=$pkgver")
source=("https://salsa.debian.org/debian/${pkgname}/-/archive/debian/${_pkgver}/${_pkgname}-${_pkgver}.tar.bz2")
sha256sums=('407d72a6885f0655dc3bfa725c20f9924ac97791803239ab3e70e5cdda78b07d')

build() {
	cd "$srcdir/${_pkgname}-${_pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${_pkgname}-${_pkgver}"
	make DESTDIR="$pkgdir" install
}
