# Maintainer: SanskritFritz

pkgname=quabro
pkgver=0.6.1
_mainver=0.6
pkgrel=2
pkgdesc="Clear blocks by controlling a ball with four paddles on each side of the screen."
arch=('any')
url=http://sourceforge.net/projects/quabro/
license=('GPLv3')
depends=('python2-pygame')
source=(http://sourceforge.net/projects/${pkgname}/files/Development/Alpha/${_mainver}/${pkgname}-${pkgver}_all-platforms.zip
        quabro.sh
	quabro.desktop)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i "s/python/python2/" quabro.py
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/quabro"
  cp --preserve --recursive * "${pkgdir}/usr/share/quabro/"

  install -Dm755 "${srcdir}/quabro.sh" "${pkgdir}/usr/bin/quabro"
  install -Dm644 images/logo.png "${pkgdir}/usr/share/pixmaps/quabro.png"
  install -Dm644 $srcdir/quabro.desktop "${pkgdir}/usr/share/applications/quabro.desktop"
}

md5sums=('2b903400f02320075168fe9cba6dde78'
         'af5405bc154f696c719e9ad50d34b1b6'
         '8301d041af281d9517be7e097cfd1ac8')

