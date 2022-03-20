# Maintainer: Joshua Haase <hahj87@gmail.com>
pkgname=python-ruamel.yaml.cmd
_name=${pkgname#python-}
pkgver=0.5.10
pkgrel=1
pkgdesc="commandline utility to manipulate YAML files"
arch=('any')
url="https://pypi.org/project/ruamel.yaml.cmd/"
license=('GPL')
makedepends=(
  python-setuptools
  python-pip
  python-wheel
  'python-configobj'
  'python-dateutil'
  'python-ruamel-yaml'
  'python-ruamel.yaml.clib'
)
depends=(python)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('043c149c5517cfd0c7d02bd934224e1c9b0053a05e292a14f1b1a7f15bf0a943')

build() {
  cd "${srcdir}/$_name-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/$_name-${pkgver}"
  python -m pip install . --root="${pkgdir}" --use-pep517 --no-warn-script-location --no-build-isolation
}
