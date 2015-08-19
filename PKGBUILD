# Maintainer: yesuu zhang <yesuu79@qq.com>

pkgname=xpyb-git
pkgver=r93.ed0147e
pkgrel=1
pkgdesc='XCB-based Python bindings for the X Window System'
url='http://xcb.freedesktop.org'
license=('X11')
arch=('i686' 'x86_64')
depends=('python2' 'xcb-proto' 'libxcb>=1.7')
makedepends=('gcc' 'git')
source=('git://anongit.freedesktop.org/xcb/xpyb')
sha256sums=('SKIP')

build() {
	cd "${srcdir}/xpyb"
	PYTHON=python2 ./autogen.sh --prefix=/usr
	make
}

package() {
	cd "${srcdir}/xpyb"
	make DESTDIR="$pkgdir" install
}

