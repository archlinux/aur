# Maintainer: Joseph Diza <josephm.diza@gmail.com

pkgname=python-wora-git
pkgver=0.1.6
pkgrel=1
arch=('any')
pkgdesc='Write once run anywhere, a python library with general purpose utilities.'
url='https://github.com/jmdaemon/wora'
license=('GPL')
depends=('python-toml')
optdepends=()
makedepends=('python-setuptools')
source=("$pkgname::git+https://github.com/jmdaemon/wora#branch=master")
provides=(python-wora)
conflicts=(python-wora)
sha512sums=("SKIP")

build() {
  cd "$pkgname"
  python setup.py build
}

package() {
  cd "$pkgname"
  python setup.py install --root "$pkgdir" --optimize=1
}
