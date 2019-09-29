# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=nodejs-webtorrent-cli
_pkgname="${pkgname#nodejs-}"
pkgver=3.0.4
pkgrel=1
pkgdesc='WebTorrent, the streaming torrent client. For the command line.'
arch=('i686' 'x86_64')
url='https://webtorrent.io'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/feross/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7543429892b44e5bace355620d5a2632ebd4d9785929944fe08784d503609629')
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
