# Maintainer: Streetwalrus <streetwalrus@codewalr.us>
pkgname=convertimg-git
pkgver=20150518.f3e5fed
pkgrel=1
pkgdesc="Convert images to header files for Ndless libraries"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/Vogtinator/ConvertImg"
license=('None')
depends=('qt5-base')
makedepends=('git')
source=('git+https://github.com/Vogtinator/ConvertImg.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/ConvertImg/ConvertImg"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "${srcdir}/ConvertImg/ConvertImg"
  qmake .
  make
}

package() {
  cd "${srcdir}/ConvertImg/ConvertImg"
  make install INSTALL_ROOT="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
