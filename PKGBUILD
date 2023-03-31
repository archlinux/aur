# Maintainer: Utsav <aur (a) utsav2 [.] dev>

pkgname=python-glean_parser
pkgver=7.1.0
pkgrel=1
pkgdesc="Tools for parsing the metadata for Mozilla's glean telemetry SDK"
arch=('any')
license=('MPL2')
url="https://github.com/mozilla/glean_parser"
depends=('python' 'python-yaml' 'python-appdirs' 'python-click' 'python-jinja' 'python-jsonschema' 'python-iso8601' 'python-diskcache' 'python-pip')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/35/91/7a0e479237dfb56d224ab81911be002852debbb9969ffdf53d4c661f6fd8/glean_parser-${pkgver}.tar.gz")
sha256sums=('c48960dd6fc0dc506f54e1229ff92ed10766cc65e598e9b9c8b798be81a4ccd5')

build() {
  cd "glean_parser-${pkgver}"
  python setup.py build
}

package() {
  cd "glean_parser-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
