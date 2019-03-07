# Maintainer:  Eric Bailey <nerflad@gmail.com>
# Contributor: Bruno Pagani <bruno.n.pagani@gmail.com>
pkgname=toilet
_commit=3eb9d58037afb0a1baec6dca82caa045fb2217c0
pkgver=0.3.r155.${_commit:0:7}
pkgrel=1
pkgdesc="free replacement for the FIGlet utility."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/cacalabs/toilet"
license=('custom:WTFPL')
depends=('libcaca')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/${_commit}.tar.gz")
sha256sums=('a16b3a6217852d4ec5e9fa94c5600b900710d652910ac041bf1c5c61524a03d4')

build() {
    cd $pkgname-${_commit}
    ./bootstrap
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-${_commit}
    make DESTDIR="$pkgdir" install
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/${pkgname}/COPYING
}
