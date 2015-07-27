# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: xav <xav at ethetricks dot eu>

pkgname=tpmmanager
pkgver=0.8.1
pkgrel=8
pkgdesc="TPM management software providing an easy to use graphical user interface"
arch=('i686' 'x86_64')
url="https://www.sirrix.com/content/pages/tpmmanager_en.htm"
license=('GPL')
depends=('qt4>=4.4' 'trousers')

source=(https://github.com/Sirrix-AG/TPMManager/archive/v${pkgver}.zip)
md5sums=('a0a9f27e6ba1756ca547206a321db5b7')
sha512sums=('8b6e1c27b8e0840e37d4d33fe05629c66ab337f8509de03d58076837715a6689f718aa87e035729e7e1b06ab4e9e9885a30ef857941fa6bdac2fd1ddc153ed18')

build() {
  cd "${srcdir}/TPMManager-${pkgver}"
  qmake-qt4 QMAKE_CFLAGS+=-fpermissive QMAKE_CXXFLAGS+=-fpermissive
  make
}

package() {
  cd "${srcdir}/TPMManager-${pkgver}"
  install -D -m755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
