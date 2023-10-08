pkgname=python-sip
pkgver=6.7.11
pkgrel=1
arch=(x86_64)
pkgdesc='A tool that makes it easy to create Python bindings for C and C++ libraries'
url='https://www.riverbankcomputing.com/software/sip/intro'
license=('custom:"sip"')
provides=(sip python-sip)
depends=(python-toml python-packaging python-setuptools python-ply)
makedepends=(python-build python-installer python-wheel)
source=(https://pypi.python.org/packages/source/s/sip/sip-$pkgver.tar.gz)
sha256sums=('f0dc3287a0b172e5664931c87847750d47e4fdcda4fe362b514af8edd655b469')

build() {
  cd sip-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd sip-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
