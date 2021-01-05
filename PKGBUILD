pkgname=sip6
pkgver=6.0.0
pkgrel=1
arch=(x86_64)
pkgdesc="A tool that makes it easy to create Python bindings for C and C++ libraries"
url='https://www.riverbankcomputing.com/software/sip/intro'
license=('custom:"sip"')
depends=(python-setuptools python-toml)
source=("https://pypi.python.org/packages/source/s/sip/sip-$pkgver.tar.gz")
sha256sums=('6185160e1aa8e167b5919c4761cbbf68cc7478d34fb655b3a28b3eb9acb5943a')

build() {
  cd sip-$pkgver
  python setup.py build
}

package() {
  cd sip-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
