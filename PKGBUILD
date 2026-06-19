pkgname=mdeditor-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight, modern Markdown editor with AI capabilities"
arch=('x86_64')
url="https://github.com/Aarav90-cpu/mdEditor"
license=('MIT')
depends=('python' 'python-pywebview' 'python-qtpy' 'python-pyqt6' 'python-pyqt6-webengine' 'python-pandas' 'python-openpyxl' 'glibc')
makedepends=('gcc' 'make')
provides=('mdeditor')
conflicts=('mdeditor')
source=()
md5sums=()

pkgver() {
  cd "$srcdir/.."
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || echo 1.0.0
}

build() {
  cd "$srcdir/.."
  make
}

package() {
  cd "$srcdir/.."
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
