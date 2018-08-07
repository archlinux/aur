# Maintainer: stef204 < base64 -d c3RlZjIwNEB5YW5kZXguY29tCg== >

pkgname=etmtk-git
pkgver=r1148.d971c97
pkgrel=3
pkgdesc="Manage events and tasks using simple text files."
arch=('any')
url="http://people.duke.edu/~dgraham/etmtk/"
license=('GPL')
depends=('tk' 'python-dateutil' 'python-yaml')
optdepends=('python-icalendar: iCalendar support')
makedepends=('python-setuptools')
source=("git+https://github.com/dagraham/etm-tk.git")
md5sums=('SKIP')

pkgver() {
  cd etm-tk
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd etm-tk
  python setup.py install --prefix=/usr --root="$pkgdir"
}
