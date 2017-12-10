# Maintainer: Joakim Nylen <me at jnylen dot nu>

pkgname=iris-temperature
pkgver=0.9.2.2
pkgrel=2
pkgdesc="Adjusts the color temperature of your screen according to your surroundings."
arch=('x86_64' 'i686')
license=('custom: Iris tech')
url="https://iristech.co/iris/"
options=('!strip' '!upx')

provides=('iris')

source=('iris.desktop' 'iris.png::https://iristech.co/wp-content/themes/iris/img/Logo.png')

sha256sums=('3cb01db99de3de6ad4a991afe153388b8ff1511f91f12e4bc04144ad2d17c95e' 'c77e58a67a22fbdbdb4b1ffbcc9625a2ccbf55d4b082de56827f340257b4ef74')
sha256sums_x86_64=('0e0ce86f8333eb9bf6a41a495b70e1bff96b8b573e30ee1ac0a3f2ac9de7ee97')
sha256sums_i686=('1ec3a8293be6a32ccf9957d1856bca828294e71cfa7fbea02818865d672346aa')
noextract=("Iris-${pkgver}.AppImage")

source_x86_64=("https://raw.githubusercontent.com/danielng01/Iris-Builds/master/Linux/Iris-${pkgver}-Linux-64bit.tar.gz")

source_i686=("https://raw.githubusercontent.com/danielng01/Iris-Builds/master/Linux/Iris-${pkgver}-Linux-32bit.tar.gz")

depends=("libselinux")

package() {
  mkdir -p ${pkgdir}/usr/bin/
  install -m 755 Iris-${pkgver}.AppImage ${pkgdir}/usr/bin/iris

  mkdir -p ${pkgdir}/usr/share/pixmaps
  mkdir -p ${pkgdir}/usr/share/applications

  install iris.png ${pkgdir}/usr/share/pixmaps

  install -Dm644 "${srcdir}/iris.desktop" "${pkgdir}/usr/share/applications/iris.desktop"
}
