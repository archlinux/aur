# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>

pkgname=mcjoin
pkgver=2.12
pkgrel=2

pkgdesc="A simple and easy-to-use tool to test IPv4 and IPv6 multicast"
arch=('x86_64')
url='https://github.com/troglobit/mcjoin'
license=('ISC')
makedepends=('git')
depends=('glibc')
conflicts=('mcjoin')
source=("git+${url}#tag=v${pkgver}")
sha256sums=('e3a222aff211ebe0ec753df28033ef8db6037e29ddfa1f3d4abd3ca33641cc08')

build() {
  cd "${pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install-strip
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "../../doc/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et
