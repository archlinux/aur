# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=diun

pkgname=diun-bin
pkgver=4.26.0
pkgrel=1
pkgdesc="Receive notifications when an image is updated on a Docker registry."
arch=('x86_64')
url="https://github.com/crazy-max/diun"
conflicts=('diun')
provides=('diun')
license=('MIT')
source=("${_pkggit}-${pkgver}_linux_amd64.tar.gz::https://github.com/crazy-max/${_pkggit}/releases/download/v${pkgver}/${_pkggit}_${pkgver}_linux_amd64.tar.gz"
        "diun.service::https://gitlab.com/mapanare-labs/packages/archlinux/diun-bin/-/raw/main/diun.service")
sha256sums=('b8cfc7e6fece0c88c49b661663abfd358ff84475fd6506cca3b3c7571a48b9e8'
            '902084dd9bb29d19bd27de9ca6030781a7582a2353c1eeb3a9b2e5e86707a1e3')

package() {
  cd "${srcdir}"
  install -Dm755 ${_pkggit} ${pkgdir}/usr/bin/${_pkggit}
  install -Dm755 diun.service ${pkgdir}/etc/systemd/system/diun.service
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md
}
