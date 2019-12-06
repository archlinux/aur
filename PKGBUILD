# Maintainer: piernov <piernov@piernov.org>

pkgname=python-ruptures-git
pkgver=r213.b98fdc8
pkgrel=1
pkgdesc="change point detection in Python"
arch=('any')
url="https://github.com/deepcharles/ruptures"
license=('BSD')
depends=('python-numpy' 'python-scipy')
makedepends=('python-setuptools')
source=("git+https://github.com/deepcharles/ruptures.git")
sha512sums=('SKIP')

pkgver() {
	cd ruptures
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ruptures
  python setup.py build
}

package() {
  cd ruptures
  python setup.py install --root "$pkgdir" --prefix=/usr --optimize=1 --skip-build
}
