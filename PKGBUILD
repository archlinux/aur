# Contributor: Tpaefawzen <GitHub: Tpaefawzen>
# Contributer: Hugo Osvaldo Barrera <hugo@whynothugo.nl>

pkgname=lsplug
pkgver=6
pkgrel=1
pkgdesc="Nicer version of lsusb"
arch=('any')
url="https://git.sr.ht/~martijnbraam/lsplug"
license=('MIT')
depends=('python' 'hwdata')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(${pkgname}-${pkgver}.tar.gz::"https://git.sr.ht/~martijnbraam/lsplug/archive/${pkgver}.tar.gz")
sha512sums=('6745feac03435541bb6c5acf0da45d5ed4dd4f2ab3921e33a7ba4156705b947d5f95db1f17c84079e5335575395c154d87a3fdfc7c2ff9eb85849e65662f4bf5')


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
