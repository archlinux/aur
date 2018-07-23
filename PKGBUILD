# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=nodejs-webtorrent-cli
_pkgname="${pkgname#nodejs-}"
pkgver=1.12.3
pkgrel=1
pkgdesc='WebTorrent, the streaming torrent client. For the command line.'
arch=('i686' 'x86_64')
url='https://webtorrent.io'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/feross/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b9dd8f12157e113e5c757da1d1b2cf2f08202c1bb9913392d807c7cd65262639')
noextract=("${_pkgname}-${pkgver}.tar.gz")

package() {
  npm \
    install \
    --user root \
    --global \
    --prefix "${pkgdir}/usr" \
    "${srcdir}/${_pkgname}-${pkgver}.tar.gz"
}

# vim:set ts=2 sw=2 et:
