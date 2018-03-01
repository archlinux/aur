# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: cdhotfire <cdhotfire@gmail.com>

pkgname=rawstudio
pkgver=2.0_git20161101
_commit=6643b14b373e8407a7803e5f5bf5f7892aa7460e
pkgrel=2
pkgdesc='An open source raw-image converter written in GTK+'
arch=('x86_64')
license=('GPL')
url='http://rawstudio.org/'
depends=('osm-gps-map' 'desktop-file-utils' 'libgphoto2' 'fftw' 'gconf' 'lcms2' 'exiv2' 'lensfun')
makedepends=('git')
source=("git://github.com/rawstudio/rawstudio.git#commit=${_commit}")
md5sums=('SKIP')

build() {
  cd "${pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr --disable-static
  make CXXFLAGS="-Wno-narrowing"
}

package() {
  cd "${pkgname}"
  make prefix="${pkgdir}/usr" install
}
