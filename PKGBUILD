# Maintainer: Thiago Perrotta <tbperrotta@gmail.com>
pkgname=i3a
pkgver=2.0.1
pkgrel=3
pkgdesc="a set of scripts used for automation of i3 and sway window manager layouts"
arch=('any')
url="https://pypi.org/project/i3a"
license=('GPL')
groups=('i3')
depends=('python-i3ipc')
makedepends=('python-pip' 'python-setuptools' 'python-wheel')
optdepends=(
  'i3-wm: for X11 setup'
  'sway: for Wayland setup'
)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('da4d4762d809efaa972ef5fa4663922ad30c83e2bbdb69fc53d62604036f42f1')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
