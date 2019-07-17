# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname="ykchorus"
pkgver=0.2.2
pkgrel=1
pkgdesc="A stereo dual-chorus audio effect"
arch=('i686' 'x86_64')
url="https://github.com/SpotlightKid/${pkgname}"
license=('GPL2')
depends=('libglvnd')
optdepends=('jack: stand-alone JACK client program')
groups=('ladspa-plugins' 'lv2-plugins' 'vst-plugins')
source=("https://github.com/SpotlightKid/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-source.tar.gz")
md5sums=('5763a1afa37e7cca6367b6c610b815ef')

build() {
  cd "${srcdir}/${pkgname}"

  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" install
}
