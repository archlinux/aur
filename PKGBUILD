pkgname=alt-media-writer
_pkgname=ALTMediaWriter
_author=altlinux
pkgver=0.6.1
pkgrel=1
pkgdesc='ALT Media Writer is a tool that helps users put ALT images on their portable drives such as flash disks.'
arch=('any')
url="https://github.com/${_author}/${_pkgname}"
license=('GPL2')
depends=('xz' 'qt5-base' 'qt5-imageformats' 'qt5-tools' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-svg'
         'qt5-quickcontrols' 'qt5-x11extras')
optdepends=('udisks2: Disk Management Service for disk installation')
source=("https://github.com/altlinux/ALTMediaWriter/archive/master.tar.gz")
md5sums=('1dc3775ea9304a33cf274a843974b415')

build() {
  cd "ALTMediaWriter-master"

  qmake-qt5 PREFIX=/usr .
  make
}


package() {
  cd "ALTMediaWriter-master"

  INSTALL_ROOT="${pkgdir}" make install
}
