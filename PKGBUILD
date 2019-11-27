# Maintainer: piernov <piernov@piernov.org>

pkgname=python-ruptures-git
pkgver=r29.6761024
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
	cd "${_pkgname}"
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
