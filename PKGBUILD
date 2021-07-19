# Maintainer: Peter Semiletov <peter.semiletov@gmail.com>

pkgname=tea-qt-git
pkgver=60.4.0.r1
pkgrel=1
pkgdesc="Powerful text editor for Linux, *BSD, Windows, OS/2, Mac and Haiku OS"
arch=('x86_64')
url="http://tea.ourproject.org"
license=('GPL')
depends=('qt6-base' 'qt6-5compat' 'gcc-libs' 'zlib' 'hunspell' 'desktop-file-utils')
makedepends=('cmake' 'git')
provides=('tea')
conflicts=('tea')

source=("git+https://github.com/psemiletov/tea-qt.git")
md5sums=('SKIP')

build() {
  mkdir -p "${srcdir}/tea-qt/b"
  cd "${srcdir}/tea-qt/b"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd "${srcdir}/tea-qt/b"
  make DESTDIR="$pkgdir" install
}
