# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=nodejs-webtorrent-cli
_pkgname="${pkgname#nodejs-}"
pkgver=1.9.0
pkgrel=1
pkgdesc='WebTorrent, the streaming torrent client. For the command line.'
arch=('i686' 'x86_64')
url='https://webtorrent.io'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://github.com/feross/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5e5238267e2119484e9910b500bd46f9ebf5ae0a38f37f5044a64041bef0ac53')

package() {
  npm \
    install \
    --user root \
    --global \
    --prefix "${pkgdir}/usr" \
    --cache "${srcdir}/npm-cache" \
    "${srcdir}/${_pkgname}-${pkgver}"
}

# vim:set ts=2 sw=2 et:
