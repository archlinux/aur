# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>
# Maintainer: Emil Vatai <emil.vatai@gmail.com>
 
pkgbase="python-sacred"
pkgname=("python-sacred")
_pkgname="sacred"

pkgver=0.8.2
pkgrel=0
epoch=0

pkgdesc='Sacred is a tool to configure, organize, log and reproduce computational experiments.'
arch=('any')
url='https://github.com/IDSIA/sacred'
license=('MIT')

makedepends=('python-distribute')
checkdepends=('python-pymongo')
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('4b530f1a96faf077270431d73245d2f5')

build() {
  msg "Building Python 3"
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

# check() {
#   cd "$srcdir/$_pkgname-$pkgver"
#   pytest
# }

package_python-sacred() {
  depends=('python' 'python-docopt' 'python-wrapt' 'python-jsonpickle' 'python-mock' 'python-munch' 'python-py' 'python-pbr' 'python-pytest' 'python-py-cpuinfo' 'python-gitpython')
  optdepends=('python-numpy' 'python-pymongo')
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
