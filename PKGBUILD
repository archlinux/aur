# Maintainer: Evan Edwards <evan@ejedev.com>

pkgname=python-xmltojson
pkgver=2.0.3
pkgrel=1
pkgdesc="Cli tool and Python module to convert XML to JSON"
url="https://github.com/shanahanjrs/xmltojson"
license=('Apache-2.0')
arch=('any')
depends=('python' 'python-xmltodict')
makedepends=('python-poetry' 'python-installer')
source=("https://files.pythonhosted.org/packages/c5/bd/7ff42737e3715eaf0e46714776c2ce75c0d509c7b2e921fa0f94d031a1ff/xmltojson-2.0.3.tar.gz")
sha256sums=('68a0022272adf70b8f2639186172c808e9502cd03c0b851a65e0760561c7801d')

build() {
  cd xmltojson-$pkgver
  python -m poetry build
}

package() {
  cd xmltojson-$pkgver
  python -m installer --destdir="$pkgdir" dist/xmltojson-$pkgver-py3-none-any.whl
}
