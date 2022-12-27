# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=shishi
pkgver=1.0.3
pkgrel=1
pkgdesc="A free implementation of the Kerberos 5 network security system"
arch=('x86_64')
url="https://www.gnu.org/software/shishi/"
license=('GPL3')
depends=('libgcrypt' 'gnutls')
options=()
source=("https://ftp.gnu.org/gnu/shishi/shishi-$pkgver.tar.gz")
sha256sums=('95798ffd12dd01a4f88e0311ee03ca4a26e5cb4e5e9059a40e4fc4d9f2917e92')

build() {
  cd "${srcdir}/shishi-$pkgver"
    ./configure --prefix=/usr --sbindir=/usr/bin --localstatedir=/var --sysconfdir=/etc
    make
}

package() {
    cd "${srcdir}/shishi-$pkgver"
    make DESTDIR="${pkgdir}" install
}
