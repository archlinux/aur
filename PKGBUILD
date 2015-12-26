# Maintainer : June Tate-Gans <june@theonelab.com>
pkgname=libfixposix
pkgver='0.3.0'
pkgrel=1
pkgdesc='Thin wrapper over POSIX syscalls'
arch=('i686' 'x86_64')
url='https://github.com/sionescu/libfixposix'
license=('BSD')
depends=(
    'glibc'
)
makedepends=(
    'autoconf'
    'automake'
    'libtool'
    'pkg-config'
    'git'
    'make'
)
groups=('base-devel')
source=("https://github.com/sionescu/libfixposix/archive/v0.3.0.tar.gz")
md5sums=('049f0e855e50e2e4b423fb5edeb2630c')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    autoreconf -i -f
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -D -m644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
