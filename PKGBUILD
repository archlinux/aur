# Maintainer: Paulo Diovani <paulo@diovani.com>

pkgname=torrentflix
pkgver=9.0.5
pkgrel=1
pkgdesc="Nodejs cli app to search torrent sites and stream using peerflix"
arch=('any')
url="https://www.npmjs.com/package/torrentflix"
license=('MIT')
depends=('nodejs' 'peerflix')
makedepends=('npm')
options=(!emptydirs)
source=("https://github.com/ItzBlitz98/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1177f745035ff7a8a8b84d2e2e924199dbe08c0057376d1689b0ac1b9c149d4c')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/local/share/licenses/${pkgname}"
  npm install --cache ../cache --user root -g --production --prefix "${pkgdir}/usr/local" "../v${pkgver}.tar.gz"
}

# vim:set ts=2 sw=2 et:
