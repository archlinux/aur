# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=python-projectq
pkgver=0.4
pkgrel=1
pkgdesc='Open-source framework for quantum computing'
arch=(any)
url=https://projectq.ch
license=(Apache)
depends=(python
         python-numpy
         python-future
         python-pytest
         pybind11
         python-requests
         python-scipy
         python-networkx)
makedepends=(python-setuptools)
source=(https://github.com/ProjectQ-Framework/ProjectQ/archive/v$pkgver.tar.gz)
sha512sums=(8858d2f3d3ca38a4ea6a1e244ce5841708169fbb77c57d3778d868b94128a529cdff188add45ac5999d91e5a2a508917aa592619c54f992c910217fc050fed6e)

package() {
  cd ProjectQ-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
