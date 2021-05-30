# Maintainer: Daniil "danogentili" Gentili <daniil@daniil.it>

pkgname=posterize
pkgver=1.6
pkgrel=1
pkgdesc="Lossy PNG compressor for RGBA PNGs"
url="https://github.com/kornelski/mediancut-posterizer"
arch=('any')
license=('GPLv3')
depends=('libpng')

_pkgcommit="f5f6765065c1bfb99e18bb40953716fb3f992210"
source=("${url}/archive/${_pkgcommit}.tar.gz")
sha512sums=('9191a5684b1f540e170317e5e0b3664be710bb8ce7ce299af4cbd05cdc149b885bf0edbffac5fb0b1c081ade7decbf87595140d87ca285a91b29c4e75904b4d8')

build() {
  cd "${srcdir}/mediancut-posterizer-${_pkgcommit}"

  make
}

package() {
  cd "${srcdir}/mediancut-posterizer-${_pkgcommit}"

  install -D posterize "${pkgdir}/usr/bin/posterize"
}
