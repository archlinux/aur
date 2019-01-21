# Maintainer: Achilleas Pipinellis <axil archlinux gr>

pkgname=facette-bin
_pkgname=facette
pkgver=0.4.1
pkgrel=1
pkgdesc="Time series data visualization and graphing software"
arch=('x86_64')
url="https://facette.io/"
license=('BSD')
depends=('rrdtool' 'nodejs')
install=facette.install
source=(
  "https://github.com/$_pkgname/$_pkgname/releases/download/$pkgver/${_pkgname}_${pkgver}_linux-amd64.tar.xz"
  "${_pkgname}.tmpfiles.d"
  "${_pkgname}.install"
  "${_pkgname}.service"
)

package() {
  # Create directory structure
  install -d "${pkgdir}"/usr/bin/

  # Install binaries
  install -Dm755 facette "${pkgdir}/usr/bin/facette"
  install -Dm755 facettectl "${pkgdir}/usr/bin/facettectl"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install systemd service and tmpfiles
  install -Dm644 facette.service     "${pkgdir}/usr/lib/systemd/system/facette.service"
  install -Dm644 facette.tmpfiles.d  "${pkgdir}/usr/lib/tmpfiles.d/facette.conf"
}
sha512sums=('1542d7f8d06a3197e0e632eb7b61d0a489b973243207ae34b656627f82686c64a644f6f5967039892ecc57909babd79c79080cf573f6d328a34032c93966cbdf'
            '175a07e268c323c0ee3d8c770d811ad3b2a2ee1a10afdcb882c5591680fe2c633a2cbd1136ac6150d47549b3dec905748c98dea3dd3ef77cf9f1a15dd6cab322'
            '551dc7db9f8d6f5b332f4d88be8951275d337193ab289c97bbdb17735bde5201bca87dd24c469e099cea67c5f17e08ac3465ab70cbabd5355d656db3e3329903'
            'bfa91531eda0eae6f5ae5e120d1c30d8641039ea1a6b1b317a9f7c2deee228a824eccd8589178388ea58f834b2862ab76fd668ef3c6a85c7118f825b23e82c9a')
