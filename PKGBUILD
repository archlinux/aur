# Maintainer: Manuel Kauschinger <admin at bruzzzla dot de>
# Contributor: Serkan Hosca <serkan@hosca.com>

pkgbase=python-cfgv
pkgname=python-cfgv
pypi_name=cfgv
pkgver=3.0.0
pkgrel=1
pkgdesc="Validate configuration and produce human readable error messages."
arch=('any')
license=('MIT')
url="https://pypi.org/project/cfgv/"
makedepends=('python' 'python-setuptools')
source=("https://pypi.io/packages/source/c/${pypi_name}/${pypi_name}-${pkgver}.tar.gz")
md5sums=('25dfe5f7a55914666e0da155592cd92b')

prepare() {
  cp -a ${pypi_name}-${pkgver}
}

build() {
  cd "${srcdir}/${pypi_name}-${pkgver}"
  python setup.py build

}

package_python-cfgv() {
  pkgdesc='Python 3 client for cfgv'
  depends=('python' 'python-six')

  cd "${srcdir}/${pypi_name}-${pkgver}"
  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}" --skip-build
}

# vim: set ft=sh ts=4 sw=4 noet:
