# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=faustfilters
pkgver=0.3.0
pkgrel=1
pkgdesc="A collection of virtual-analog filter plugins"
arch=('i686' 'x86_64')
url="https://github.com/SpotlightKid/${pkgname}"
license=('MIT')
depends=('gcc-libs')
groups=('pro-audio' 'ladspa-plugins' 'lv2-plugins' 'vst-plugins')
source=("https://github.com/SpotlightKid/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-source.tar.gz")
md5sums=('008fc0b7913427d2c8dbbb4bf072af23')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" PREFIX=/usr install
  # install documentation
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  # install license file
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
