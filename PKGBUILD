# Maintainer: <n17ikh@gmail.com>
pkgname=luksipc-git
_gitname=luksipc
pkgver=0.04.r2.g16e3285
pkgrel=1
pkgdesc="A tool to convert unencrypted block devices to encrypted LUKS devices in-place - git version"
arch=(any)
url="http://www.johannes-bauer.com/linux/luksipc"
license=('GPL3')
conflicts=('luksipc')
source=(git+https://github.com/johndoe31415/luksipc.git)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_gitname}"
    git describe --long | sed 's/^FOO-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${_gitname}"
	make all
}

package() {
    cd "$srcdir/${_gitname}"
	install -Dm 755 luksipc $pkgdir/usr/bin/luksipc
}
