# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=nodejs-webtorrent-cli
_pkgname="${pkgname#nodejs-}"
pkgver=1.11.0
pkgrel=1
pkgdesc='WebTorrent, the streaming torrent client. For the command line.'
arch=('i686' 'x86_64')
url='https://webtorrent.io'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/feross/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0b3beac9a3616176e870109e691163cbb601dd03d49fce63ce61581871876ba1')
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
