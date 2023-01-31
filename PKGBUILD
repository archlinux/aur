# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ethq'
pkgver='0.6.2'
_gitver='0_6_2'
pkgrel='1'
pkgdesc='Displays an auto-updating per-second count of the number of packets and bytes being handled by each specified NIC'
arch=('any')
url="https://github.com/isc-projects/${pkgname}"
license=('MPL')
depends=('ncurses')
source=("${url}/archive/v${_gitver}.tar.gz")
md5sums=('426489b4fb1cb218b967accc89acdece')

build() {
  cd "${srcdir}/${pkgname}-${_gitver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_gitver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
