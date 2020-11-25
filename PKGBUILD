# Maintainer: Joakim Nylen <me at jnylen dot nu>

pkgname=iris-temperature
pkgver=0.9.9
pkgrel=4
pkgdesc="Adjusts the color temperature of your screen according to your surroundings."
arch=('x86_64')
license=('custom: Iris tech')
url="https://iristech.co/iris/"
options=('!strip')

provides=('iris')
source=('iris.desktop' 'iris.png::https://iristech.co/wp-content/themes/iris/img/Logo.png'
	"https://raw.githubusercontent.com/danielng01/product-builds/master/iris/linux/Iris-${pkgver}-Linux-64bit.zip")
sha256sums=('3cb01db99de3de6ad4a991afe153388b8ff1511f91f12e4bc04144ad2d17c95e'
            'f94af99fe39db4999ea6fadfd7e7be59014879155c72a879f358099de33bb4bd'
            '2b11f02c732d543717bc7131d7d197c5564d285213e7779128c3441ac3c71489')
noextract=("Iris-${pkgver}.AppImage")
depends=("libselinux")

package() {
  mkdir -p ${pkgdir}/usr/bin/
  install -m 755 Iris-${pkgver}.AppImage ${pkgdir}/usr/bin/iris

  mkdir -p ${pkgdir}/usr/share/pixmaps
  mkdir -p ${pkgdir}/usr/share/applications

  install iris.png ${pkgdir}/usr/share/pixmaps

  install -Dm644 "${srcdir}/iris.desktop" "${pkgdir}/usr/share/applications/iris.desktop"
}
