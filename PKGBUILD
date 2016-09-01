# Maintainer: Johan Förberg <johan@forberg.se>
pkgname=zstd-git
_pkgname=zstd
pkgver=v1.0.0.r4.g4798793
pkgrel=1
pkgdesc='A fast and efficient compression algorithm.'
arch=('i686' 'x86_64')
url='https://github.com/facebook/zstd'
license=('BSD' 'GPL2')
groups=()
depends=('glibc')
makedepends=('git')
conflicts=('zstd')
provides=('zstd')
source=('git://github.com/facebook/zstd.git')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
}

package() {
    cd "$srcdir/$_pkgname"
    make PREFIX="/usr" DESTDIR="$pkgdir/" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

