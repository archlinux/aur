# Maintainer: Wojciech Szymecki <w.szymecki-at-g;mail-com>
pkgname="zmqpp"
pkgver=4.2.0
pkgrel=2
pkgdesc="High-level C++ binding for ZMQ."
arch=('i686' 'x86_64')
url="http://zeromq.github.io/zmqpp/"
license=('custom:MPL2')
depends=('zeromq')
source=("https://github.com/zeromq/zmqpp/archive/${pkgver}.tar.gz")
md5sums=('5107edd1423187be7e26d9dd738753b8')

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make PREFIX="/usr/" DESTDIR="${pkgdir}/" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
