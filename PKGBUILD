
pkgname=python-pyfreenet3-git
pkgver=r953.471a62f78b3b8b69a8856f56625f1468c04b6836
pkgrel=2
pkgdesc='Python FCPv2 library and utilities '
arch=('any')
url='https://github.com/freenet/pyFreenet'
license=()
depends=('python')
makedepends=('python-setuptools')
provides=('python-pyfreenet3')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/pyFreenet
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse HEAD)"
}

check() {
  cd $srcdir/pyFreenet
  python3 setup.py check
}

package() {
  cd $srcdir/pyFreenet
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
