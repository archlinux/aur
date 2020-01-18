# Maintainer: GI Jack <GI_Jack@hackermail.com>
pkgname=onion-service-index 
pkgver=1.0.1
pkgrel=1
pkgdesc="Python Webapp with a linked indexed TOR .onion space enumeration"
arch=('any')
url="https://github.com/GIJack/onion-service-index"
license=('Affero')
depends=('python' 'python-flask')
optdepends=('tor: for opening .onion links'
	    'yacy: search engine for exploring')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GIJack/onion-service-index/archive/v${pkgver}.tar.gz")
sha256sums=('9894318f4c6fee73a1d7aea6d99519386648cb1f3b6fdacffb09db76aedfe333')

package() {
  cd "${pkgname}-${pkgver}"
  # Copy everything in the webapp
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -ra * "${pkgdir}/usr/share/${pkgname}"

  # copy the config
  install -Dm644 onion-service-index.config "${pkgdir}/etc/onion-service-index.config"

  # copy sytemd unit file
  install -Dm644 onion-service-index.service "${pkgdir}/usr/lib/systemd/system/onion-service-index.service"
}
