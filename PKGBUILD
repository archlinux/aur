# Maintainer: Mars160 <wapollo9@gmail.com>

pkgname=vuetorrent-bin
_upstream_name=vuetorrent
pkgver=2.34.0
pkgrel=1
pkgdesc='Modern web UI for qBittorrent'
arch=('any')
url='https://github.com/VueTorrent/VueTorrent'
license=('GPL-3.0-only')
optdepends=(
  'qbittorrent: BitTorrent client with WebUI support'
  'qbittorrent-nox: Headless BitTorrent client with WebUI support'
)
provides=("${_upstream_name}=${pkgver}")
conflicts=("${_upstream_name}")
source=("${_upstream_name}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_upstream_name}.zip")
sha256sums=('22f34c20f6a5704e3b37c3ed73956af7bda5536c10458575c52b0618851b665e')

package() {
  install -d "${pkgdir}/usr/share/webapps/${_upstream_name}"
  cp -r "${srcdir}/${_upstream_name}/." "${pkgdir}/usr/share/webapps/${_upstream_name}/"
}
