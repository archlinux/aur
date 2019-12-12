# Maintainer: Manuel Kauschinger <admin bruzzzla de>
# Contributor: Serkan Hosca <serkan@hosca.com>

pkgbase=python-aspy-yaml
pkgname=(python-aspy-yaml)
pypi_name=aspy.yaml
pkgver=1.3.0
pkgrel=1
pkgdesc="A few extensions to pyyaml"
arch=('any')
license=('MIT')
url="https://github.com/asottile/aspy.yaml"
depends=('python')
source=("https://pypi.io/packages/source/a/${pypi_name}/${pypi_name}-${pkgver}.tar.gz")
md5sums=('1959a34873a6bdc1fba807023804867e')

prepare() {
  cp -a ${pypi_name}-${pkgver}
}

build() {
  cd "${srcdir}/${pypi_name}-${pkgver}"
  python setup.py build
}

package_python-aspy-yaml() {
  pkgdesc='Python 3 extensions to pyyaml'
  depends=('python' 'python-yaml')

  cd "${srcdir}/${pypi_name}-${pkgver}"
  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}" --skip-build
}

# vim: set ft=sh ts=4 sw=4 noet:
