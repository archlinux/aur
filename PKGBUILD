# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=bennugd-core
pkgver=356
pkgrel=2
pkgdesc="a programming language to create games (Fenix successor) - core"
arch=('x86_64')
url="http://sourceforge.net/projects/bennugd/"
license=('Zlib')
depends=('lib32-glibc' 'lib32-openssl' 'lib32-zlib')
makedepends=('subversion' 'gcc-multilib')
source=("bennugd-core::svn+https://svn.code.sf.net/p/bennugd/code/core#revision=${pkgver}")
md5sums=('SKIP')

build() {
    cd $srcdir/bennugd-core
    chmod +x ./configure
    ./configure --prefix=/usr --build=i686-pc-linux-gnu
    make
}

package() {
    make -C $srcdir/bennugd-core DESTDIR=${pkgdir} install
    install -Dm644 $srcdir/bennugd-core/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
