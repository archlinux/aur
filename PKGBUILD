# Maintainer: Cody P Schafer <archlinux@codyps.com>
# Comaintainer: John Eivind Helset <jehelset@gmail.com>

pkgname=debugedit
pkgver=5.0
pkgrel=1
pkgdesc='Tool to mangle source locations in .debug files'
arch=('x86_64')
url='https://sourceware.org/debugedit/'
license=('LGPL2.1')
depends=('libelf' 'glibc')
source=("https://sourceware.org/ftp/debugedit/${pkgver}/debugedit-${pkgver}.tar.xz")
sha512sums=('7e7f529eafe41b53f0b5bfc58282fdbfa0dfa93ed7908b70e81942d6d2b6f80fc9c6bff2ed9674fd98947e5750b615f4c8b222544989e2900c5f8ff5ae0efb92')
makedepends=('autoconf' 'make')

build() {
    cd "${srcdir}/debugedit-${pkgver}"
    autoreconf -i -f
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/debugedit-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
