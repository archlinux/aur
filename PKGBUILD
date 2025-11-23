# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=input-remapper
pkgver=2.2.0
pkgrel=1
pkgdesc="A tool to change and program the mapping of your input device buttons."
arch=('any')
url="https://github.com/sezanzeb/input-remapper"
license=('GPL-3.0-or-later')
depends=('gtk3' 'gtksourceview4' 'python-cairo' 'python-evdev' 'python-gobject' 'python-packaging' 'python-psutil' 'python-pydantic' 'python-dasbus' 'python-pydbus')
optdepends=('xorg-xmodmap: symbol names matching the keyboard layout')
makedepends=('git' 'python-setuptools')
conflicts=("$pkgname-bin" "$pkgname-git" 'key-mapper')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('62b44d9589cf256262240cb49667ef5ce63d36f9de50578321f148329d539a2d')

build() {
  cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir"
}
