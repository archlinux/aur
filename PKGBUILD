# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# Contributor: Llumex03
# Maintainer in Chakra: gnastyle
# Contributor in Chakra: FranzMari from Chakra
# Contributor in Chakra: danyf90 <daniele.formihelli@gmail.com>
# Contributor in Chakra: totoloco <totoloco@gmx.com>

pkgname=cutegram
_pkgname=Cutegram
pkgver=2.7.0
pkgrel=1
pkgdesc="A different telegram client from Aseman team"
arch=('i686' 'x86_64')
url="http://aseman.co/en/products/cutegram/"
license=('GPL')
depends=('qt5-imageformats' 'qt5-webkit>=5.5' 'telegramqml' 'libqtelegram-ae>=2:6.0')
optdepends=('gst-plugins-bad: audio support'
'gst-plugins-good: audio and notification sound')
conflicts=('cutegram-git' 'sigram-git' 'sigram' 'cutegram')
provides=('cutegram')
replaces=('cutegram-cn')

source=("https://github.com/Aseman-Land/Cutegram/archive/v$pkgver-stable.tar.gz")

sha256sums=('67cfbcd66f6a42f6238f5404d224c2ba53b2f92bac0bece2290da8b6111d88f3')

prepare() {
  cd "${srcdir}/${_pkgname}-$pkgver-stable"
  mkdir -p build
}

build() {
  cd "${srcdir}/${_pkgname}-$pkgver-stable/build"
  qmake-qt5 -r .. PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-$pkgver-stable/build"
  make INSTALL_ROOT="${pkgdir}" install
}
