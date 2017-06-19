# Maintainer: Bogdan Sinitsyn <bogdan.sinitsyn@gmail.com>
_github_pkgname=PlayBar2
pkgname=plasma5-applets-playbar2
pkgver=2.5
pkgrel=1
pkgdesc="Applet that shows now playing music"
arch=('i686' 'x86_64')
url="https://github.com/audoban/PlayBar2/"
license=('GPL3')
depends=(
  plasma-framework
  plasma-workspace
  kdeclarative
  kglobalaccel
  kconfigwidgets
  kxmlgui
  kwindowsystem
)
conflicts=(
  kdeplasma-applets-playbar2
)

source=("https://github.com/audoban/$_github_pkgname/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')


build() {
  cd "$srcdir/$_github_pkgname-$pkgver"

  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/$_github_pkgname-$pkgver"

  cd build
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
