# Maintainer: Utsav <aur (a) utsav2 [.] dev>

pkgname=python-glean_parser
pkgver=7.2.1
pkgrel=2
pkgdesc="Tools for parsing the metadata for Mozilla's glean telemetry SDK"
arch=('any')
license=('MPL2')
url="https://github.com/mozilla/glean_parser"
depends=('python' 'python-yaml' 'python-appdirs' 'python-click' 'python-jinja' 'python-jsonschema' 'python-iso8601' 'python-diskcache')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/7e/12/61a91a583fd28ce7f1c3d462a9ee78ffee7b0d30f0c08605199e3e780d06/glean_parser-${pkgver}.tar.gz")
sha256sums=('11496ac004fe421b914c7fbdc9a1d620e4821d56e1d9f65523d3858cdb907bbd')

build() {
  cd "glean_parser-${pkgver}"
  python setup.py build
}

package() {
  cd "glean_parser-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
