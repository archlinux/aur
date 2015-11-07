# Maintainer: stef204 < base64 -d c3RlZjIwNEB5YW5kZXguY29tCg== >

pkgname=etmtk-git
pkgver=3.2.22
pkgrel=1
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
  cd "$srcdir/etm-tk"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/etm-tk"
  python setup.py install --prefix=/usr --root="$pkgdir"
}
