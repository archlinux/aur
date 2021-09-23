# Maintainer: alegru <alegru plus dev at mailbox dot org>
pkgname=multitime
pkgver=1.4
pkgrel=3
pkgdesc='Time command execution over multiple executions'
arch=('x86_64')
url='https://tratt.net/laurie/src/multitime'
license=('MIT')
depends=(glibc)
source=("${url}/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('dd85c431c022d0b992f3a8816a1a3dfb414454a229c0ec22514761bf72d3ce47')

build() {
  cd "${srcdir}/multitime-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/multitime-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
