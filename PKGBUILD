# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=peerflix
pkgver=0.39.0
pkgrel=1
pkgdesc="Streaming torrent client for node.js"
arch=('any')
url="https://github.com/mafintosh/peerflix"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mafintosh/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4255940099097670cce308e643c510a05936fa3720a35f25b5ef4c3ce185b80d')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  npm install --cache ../cache --user root -g --prefix "${pkgdir}/usr" ../*.tar.gz
}

# vim:set ts=2 sw=2 et:
