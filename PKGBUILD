# Maintainer: Librewish <librewish@gmail.com?
# Contributer: Dan Johansen <strit@manjaro.org>

pkgname=greetd-qtgreet
_pkgname=QtGreet
pkgver=1.0.0
pkgrel=2
pkgdesc='Qt based greeter for greetd, to be run under wayfire or similar wlr-based compositors.'
arch=('aarch64' 'x86_64')
url="https://gitlab.com/marcusbritanicus/QtGreet"
license=(GPLv3)
depends=('qt5-base' 'wlroots' 'wayfire' 'qt5-wayland' 'greetd')
optdepends=('wayfire' 'sway')
makedepends=('cmake' 'extra-cmake-modules' 'python')
#provides=('greetd')
#conflicts=('greetd')
install=$pkgname.install
_commit=9859e90af4da1ff724e5c1443dc5f9ce84dff10a
source=("$_pkgname-v$pkgver::https://gitlab.com/marcusbritanicus/QtGreet/-/archive/v$pkgver/QtGreet-v$pkgver.tar.gz")
#source=("git+https://gitlab.com/marcusbritanicus/QtGreet.git#commit=$_commit")
md5sums=('ea391a96c297a967e16ac4cc7300e8f9')

#pkgver() {
#  cd $pkgname
#  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
#}

prepare() {
  cd $_pkgname-v$pkgver
  #cd $_pkgname
  python setup.py prepare --no-greetd
}

build() {
  cd $_pkgname-v$pkgver
  #cd $_pkgname
  python setup.py build --no-greetd
}

package() {
  cd $_pkgname-v$pkgver
  #cd $_pkgname
  python setup.py install --prefix $pkgdir --no-greetd
}
