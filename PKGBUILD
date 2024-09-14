pkgname=alt-media-writer
_pkgname=ALTMediaWriter
_author=altlinux
pkgver=1.0.4
pkgrel=2
pkgdesc='ALT Media Writer is a tool that helps users put ALT images on their portable drives such as flash disks.'
arch=('any')
url="https://github.com/${_author}/${_pkgname}"
license=('GPL2')
depends=('xz' 'qt5-base' 'qt5-imageformats' 'qt5-tools' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-svg'
         'qt5-quickcontrols' 'qt5-x11extras' 'qt5-quickcontrols2' 'yaml-cpp')
optdepends=('udisks2: Disk Management Service for disk installation')
conflicts=('mediawriter')
source=("https://github.com/altlinux/ALTMediaWriter/archive/${pkgver}-alt${pkgrel}.tar.gz")
md5sums=('2af023fbd47017e5f38ff4bd81f0ed2d')

build() {
  cd "ALTMediaWriter-${pkgver}-alt${pkgrel}"

  qmake-qt5 PREFIX=/usr .
  make
}


package() {
  cd "ALTMediaWriter-${pkgver}-alt${pkgrel}"

  INSTALL_ROOT="${pkgdir}" make install
}
