# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ethq'
pkgver='0.7.0'
_gitver='0_7_0'
pkgrel='1'
pkgdesc='Ethernet NIC Queue stats viewer'
arch=('x86_64' 'aarch64')
url="https://github.com/isc-projects/${pkgname}"
license=('MPL')
depends=('ncurses')
source=("${url}/archive/refs/tags/v${_gitver}.tar.gz")
md5sums=('3fcfb62bf5c9ae2afac451574bb811ce')

build() {
  cd "${pkgname}-${_gitver}"
  make
}

package() {
  cd "${pkgname}-${_gitver}"
  install -Dm0755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
