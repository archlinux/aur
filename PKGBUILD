_name=flask-executor
pkgname="python-$_name"
pkgver=0.9.3
pkgrel=1
arch=('any')
pkgdesc="An easy to use Flask wrapper for concurrent.futures"
url="https://github.com/dchevell/flask-executor"
license=('MIT')
#pulling from my personal copy since upstream does not have tags. Bug report submitted for now
source=("https://github.com/GregoryLand/flask-executor/archive/v"$pkgver".tar.gz")
sha256sums=('6fc1a0edfd68627aa4d47916324ccbd518ad2302afd4c9e1fe81097e8a7221e6')
depends=(
  'python'
)

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
