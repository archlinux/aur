# Maintainer: Manuel Kauschinger <admin at bruzzzla dot de> 
# Contributor: Serkan Hosca <serkan@hosca.com>
pkgbase=python-pre-commit
pkgname=(python-pre-commit)
pypi_name=pre_commit
pkgver=2.1.0
pkgrel=1
pkgdesc="A framework for managing and maintaining multi-language pre-commit hooks."
arch=('any')
license=('MIT')
url="http://pre-commit.com/"
depends=(
  'python' 'python-nodeenv' 'python-aspy-yaml' 'python-virtualenv' 'python-cached-property' 'python-identify'
  'python-cached-property' 'python-cfgv' 'python-toml'
)
source=("https://pypi.io/packages/source/p/${pypi_name}/${pypi_name}-${pkgver}.tar.gz")
md5sums=('5ce231e54c7e229890d8ce449e07a487')

build() {
  cd "${srcdir}/${pypi_name}-${pkgver}"
  python setup.py build
}

package_python-pre-commit() {
  pkgdesc='Python 3 client for pre-commit'

  cd "${srcdir}/${pypi_name}-${pkgver}"
  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}" --skip-build
}

# vim: set ft=sh ts=4 sw=4 noet:
