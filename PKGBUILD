# Maintainer: Masato TOYOSHIMA <phoepsilonix@gmail.com>

pkgname=numlockl
pkgver=1.0
pkgrel=1
pkgdesc='Turns on the numlock key.'
arch=('x86_64')
url='https://github.com/phoepsilonix/numlockl'
license=('MIT')
depends=('libbsd')
source=(https://gitlab.com/phoepsilonix/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz)
sha512sums=('8c38c5753a275364db53dd31b2d3e086a284d59b501e10ada9f6d1fcaae1e808f48faa05ecbc4cb3a068a2c606237c7d5279dda7741836ff2c25bc2af6ab2b29')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  mkdir -p ${pkgdir}/usr/bin
  make prefix="${pkgdir}/usr" install
  
  # Install the custom MIT license
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
