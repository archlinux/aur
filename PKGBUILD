# Maintainer: David Thurstenson <thurstylark@gmail.com>

pkgname=ttf-dseg
pkgver=030
pkgrel=1
pkgdesc="Font family that imitates seven and fourteen segment displays"
arch=('any')
url="http://www.keshikan.net/fonts-e.html"
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontscale' 'xorg-mkfontdir')
source=("http://www.keshikan.net/archive/DSEG_v${pkgver}.zip")
sha256sums=('893478aa877e894c79b79dfbbc363be131d1d5060d1f79abe6c135cf57e8166b')

package() {

  cd "${srcdir}"
  mkdir -p "${pkgdir}"/usr/share/fonts/TTF/
  for i in $(find "${srcdir}"/ -name *.ttf); do
	  install -Dm644 $i "${pkgdir}"/usr/share/fonts/TTF/
  done

  install -Dm644 readme-en.txt "${pkgdir}"/usr/share/licenses/${pkgname}/README
}
