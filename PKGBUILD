# Maintainer: Paulo Diovani <paulo@diovani.com>

pkgname=torrentflix
pkgver=9.0.4
pkgrel=1
pkgdesc="Nodejs cli app to search torrent sites and stream using peerflix"
arch=('any')
url="https://www.npmjs.com/package/torrentflix"
license=('MIT')
depends=('nodejs' 'peerflix')
makedepends=('npm')
options=(!emptydirs)
source=("https://github.com/ItzBlitz98/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('e911c79e13d52c24f443c8573e81672d2de7c3e9d6f24073747c21e463947ad6')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/local/share/licenses/${pkgname}"
  npm install --cache ../cache --user root -g --production --prefix "${pkgdir}/usr/local" "../${pkgver}.tar.gz"
}

# vim:set ts=2 sw=2 et:
