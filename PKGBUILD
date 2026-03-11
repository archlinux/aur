# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>

pkgname=mcjoin
pkgver=2.12
pkgrel=2

pkgdesc="A simple and easy-to-use tool to test IPv4 and IPv6 multicast"
arch=('x86_64')
url='https://github.com/troglobit/mcjoin'
license=('ISC')
conflicts=('mcjoin')
source=("${url}/releases/download/v${pkgver}/mcjoin-${pkgver}.tar.gz")
sha256sums=('feaf5c7eef884ba98bbc20bbeba133fb6c5ee6c9251dbe05531788094014abda')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make -j $(nproc)
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install-strip
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "../../doc/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et
