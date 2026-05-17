# Contributor: Tpaefawzen <GitHub: Tpaefawzen>
# Contributer: Hugo Osvaldo Barrera <hugo@whynothugo.nl>

pkgname=lsplug
pkgver=7
pkgrel=1
pkgdesc="Nicer version of lsusb"
arch=('any')
url="https://git.sr.ht/~martijnbraam/lsplug"
license=('MIT')
depends=('python' 'hwdata')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(${pkgname}-${pkgver}.tar.gz::"https://git.sr.ht/~martijnbraam/lsplug/archive/${pkgver}.tar.gz")
sha512sums=('6b8a7363e81d743e4fcd5fa28987b068a1d66dc62cf06aa727627f2c62c88a0946a989bd72e50b5310d5f87ab3f855c8fd86e16c3390880e122540c05dbcd2e2')


build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl

  # License file
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
