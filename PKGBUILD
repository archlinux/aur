# Maintainer: Bogdan Sinitsyn <bogdan.sinitsyn@gmail.com>
_github_pkgname=PlayBar2
pkgname=plasma5-applets-playbar2
pkgver=2.5
pkgrel=3
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
sha512sums=('367984610621daecc2e1389d4d30284bdd6cc2842ee81f4638cc14863f449e811d6351ffb8832f5c95e2bb007c6d7c88e7d80f7744d01723527ddc5c6c785c96')

prepare() {
  cd "$srcdir/$_github_pkgname-$pkgver"

  mkdir -p build
}

build() {
  cd "$srcdir/$_github_pkgname-$pkgver"

  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/$_github_pkgname-$pkgver"

  cd build
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
