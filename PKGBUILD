# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Adria Arrufat <swiftscythe@gmail.com>

pkgname=fdesktoprecorder-hg
pkgver=1
pkgrel=1
pkgdesc="A program that can video record a single window or your entire desktop using ffmpeg. (Mercurial version)"
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php?content=147844"
depends=('kdelibs' 'ffmpeg' 'xorg-xwininfo')
makedepends=('cmake' 'automoc4' 'mercurial')
provides=('fdesktoprecorder')
conflicts=('fdesktoprecorder')
license=('GPL')
source=("fdesktoprecorder::hg+https://bitbucket.org/Lacky/fdesktoprecorder#branch=development")
md5sums=('SKIP')
_hgname="fdesktoprecorder"

pkgver() {
  cd "${_hgname}"
  hg identify -n
}

build() {
  cd "${_hgname}"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${_hgname}"
  make DESTDIR="${pkgdir}" install
}
