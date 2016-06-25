# $Id$
# Maintainer: hojat-mom <h1229m@gmail.com>

_upstream="al-anvar"
_pkgver=0.6.0

pkgname=al-anvar
pkgver="${_pkgver}${_micro}"
pkgrel=1
pkgdesc="Al-anvar Quran"
arch=('any')
license=('GPL')
depends=('qtwebkit' 'phonon-qt4' 'qt4')
makedepends=('qtwebkit' 'autoconf' 'pulseaudio-alsa' 'gcc'  'automake' 'libcanberra-pulse' 'git' 'liblastfm' 'phonon-qt4' 'phonon-qt4-gstreamer')
conflicts=('al-anvar-git')
#install=al-anvar.install
source=("http://downloads.sourceforge.net/project/${_upstream}/${_pkgver}/src-${_upstream}-${pkgver}.tar.gz")


build() {
  tar xf src-${_upstream}-${_pkgver}.tar.gz
  cd src-${_upstream}-${_pkgver}
  qmake-qt4
  make
}

package() {
  cd src-${_upstream}-${pkgver}

  make INSTALL_ROOT=${pkgdir} install
}


