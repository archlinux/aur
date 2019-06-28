# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=python-pylogix-git
_pkgname=pylogix
pkgver=r171.2fd71c5
pkgrel=2
pkgdesc="Read/Write data from Allen Bradley Compact/Control Logix PLC's"
arch=(any)
url="https://github.com/dmroeder/pylogix"
license=('Apache-2.0')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
  python setup.py build
}

package() {
	cd "$srcdir/${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
