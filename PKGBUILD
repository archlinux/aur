# Maintainer: Paulo Diovani <paulo@diovani.com>

pkgname=torrentflix
pkgver=9.0.3
pkgrel=1
pkgdesc="Nodejs cli app to search torrent sites and stream using peerflix"
arch=('any')
url="https://www.npmjs.com/package/torrentflix"
license=('MIT')
depends=('nodejs' 'peerflix')
makedepends=('npm')
options=(!emptydirs)
source=("https://github.com/ItzBlitz98/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('90631563d5c5bb20a9d4d584561708b49ea3a9f960beae58d23c783fbb9be761')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/local/share/licenses/${pkgname}"
  npm install --cache ../cache --user root -g --production --prefix "${pkgdir}/usr/local" "../${pkgver}.tar.gz"
}

# vim:set ts=2 sw=2 et:
