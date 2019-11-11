# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=nodejs-webtorrent-cli
_pkgname="${pkgname#nodejs-}"
pkgver=3.0.5
pkgrel=1
pkgdesc='WebTorrent, the streaming torrent client. For the command line.'
arch=('i686' 'x86_64')
url='https://webtorrent.io'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/feross/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6b849e46f4511d2aeaeb93ae544cff6b9c72202ca24388e1aee7ccefb5451296')
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
