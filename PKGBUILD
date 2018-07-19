# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname=quiterss2
_gitcommit=1e13b1493efeb35ac8308a68e2635c6d985bf22f

pkgname=quiterss2-git
pkgver=0.0.1+1+1e13b14
pkgrel=1
pkgdesc="An open-source cross-platform news feed reader written in Qt/C++/QML"
arch=('x86_64')
url="https://github.com/QuiteRSS/quiterss2"
license=('GPL-3.0')
depends=('qt5-webengine')
makedepends=('git')
conflicts=('quiterss')
source=("git+${url}.git#commit=${_gitcommit}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p build && cd build
  qmake-qt5 CONFIG+=release PREFIX=/usr ../quiterss2.pro
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"

  make INSTALL_ROOT="$pkgdir/" install
}
