# Maintainer: Daniel Lima <danielm@tinyhub.tk>

pkgname=xsysroot
pkgver=1.913
pkgrel=1
pkgdesc='Xsysroot is a tool that allows you to work with ARM images from your Intel computer.'
arch=('i686' 'x86_64')
url='https://github.com/skarbat/xsysroot'
license=('MIT')
makedepends=('git')
depends=('python2' 'qemu-user-static' 'binfmt-support')
source=(git+ssh://github.com/skarbat/xsysroot)
sha256sums=('SKIP')

pkgver() {
	grep __version__ $srcdir/xsysroot/xsysroot | cut -d' ' -f3
}

build() {
	sed -i '1 s/env python/env python2/' $srcdir/xsysroot/xsysroot
}

package() {
	install -D -m644 xsysroot/xsysroot $pkgdir/usr/bin/xsysroot
}

