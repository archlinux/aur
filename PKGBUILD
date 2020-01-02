# Maintainer: Manuel Kauschinger <admin at bruzzzla dot de> 
# Contributor: Serkan Hosca <serkan@hosca.com>
pkgbase=python-pre-commit
pkgname=(python-pre-commit)
pypi_name=pre_commit
pkgver=1.21.0
pkgrel=1
pkgdesc="A framework for managing and maintaining multi-language pre-commit hooks."
arch=('any')
license=('MIT')
url="http://pre-commit.com/"
makedepends=(
  'python' 'python-nodeenv' 'python-aspy-yaml' 'python-virtualenv' 'python-cached-property' 'python-identify'
  'python-cached-property'
)
source=("https://pypi.io/packages/source/p/${pypi_name}/${pypi_name}-${pkgver}.tar.gz")
md5sums=('75ff77c7e0954038424f2d58b0959c6c')

build() {
  cd "${srcdir}/${pypi_name}-${pkgver}"
  python setup.py build
}

package_python-pre-commit() {
  pkgdesc='Python 3 client for pre-commit'
  depends=('python' 'python-nodeenv' 'python-aspy-yaml' 'python-virtualenv' 'python-cached-property' 'python-identify'
           'python-toml' 'python-importlib-metadata')

  cd "${srcdir}/${pypi_name}-${pkgver}"
  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}" --skip-build
}

# vim: set ft=sh ts=4 sw=4 noet:
