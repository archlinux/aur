# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ethq'
pkgver='0.6.2'
_gitver='0_6_2'
pkgrel='1'
pkgdesc='Ethernet NIC Queue stats viewer'
arch=('x86_64' 'aarch64')
url="https://github.com/isc-projects/${pkgname}"
license=('MPL')
depends=('ncurses')
source=("${url}/archive/refs/tags/v${_gitver}.tar.gz")
md5sums=('426489b4fb1cb218b967accc89acdece')

build() {
  cd "${pkgname}-${_gitver}"
  make
}

package() {
  cd "${pkgname}-${_gitver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
