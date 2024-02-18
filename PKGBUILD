# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ethq'
pkgver='0.6.3'
_gitver='0_6_3'
pkgrel='1'
pkgdesc='Ethernet NIC Queue stats viewer'
arch=('x86_64' 'aarch64')
url="https://github.com/isc-projects/${pkgname}"
license=('MPL')
depends=('ncurses')
source=("${url}/archive/refs/tags/v${_gitver}.tar.gz")
md5sums=('68a62b6269998a7761c2f9d83a0138ce')

build() {
  cd "${pkgname}-${_gitver}"
  make
}

package() {
  cd "${pkgname}-${_gitver}"
  install -Dm0755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
