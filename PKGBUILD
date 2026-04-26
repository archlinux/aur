# Maintainer: alegru <alegru plus dev at mailbox dot org>
pkgname=multitime
pkgver=1.5
pkgrel=1
pkgdesc='Time command execution over multiple executions'
arch=('x86_64')
url='https://tratt.net/laurie/src/multitime'
license=('MIT')
depends=(glibc)
source=("${url}/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('bc11d8c16a180e03bd8e6076a4a6ab524b2f29f3ce3fe8f2809336a07bbcb5d1')

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
