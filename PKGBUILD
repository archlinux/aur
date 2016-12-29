# Maintainer: David Thurstenson <thurstylark@gmail.com>

pkgname=ttf-dseg
pkgver=030
pkgrel=2
pkgdesc="Font family that imitates seven and fourteen segment displays"
arch=('any')
url="http://www.keshikan.net/fonts-e.html"
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontscale' 'xorg-mkfontdir')
source=("http://www.keshikan.net/archive/DSEG_v${pkgver}.zip")
sha256sums=('893478aa877e894c79b79dfbbc363be131d1d5060d1f79abe6c135cf57e8166b')

package() {

  cd "${srcdir}"
  find "${srcdir}"/ -name '*.ttf' -execdir install -Dm644 {} -t "${pkgdir}"/usr/share/fonts/TTF \;

  install -Dm644 readme-en.txt "${pkgdir}"/usr/share/licenses/${pkgname}/README
}
