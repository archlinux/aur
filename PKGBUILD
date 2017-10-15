# Maintainer: Hugo Rodrigues <me@hugorodrigues.net>
_pipname=pylint-odoo
pkgname=python-${_pipname}
pkgver=1.8.2
pkgrel=2
pkgdesc="Pylint Odoo plugin"
arch=("any")
url="https://github.com/OCA/pylint-odoo"
license=('unknown')
depends=("eslint" "python-astroid" "python-pylint" "python-pylint-plugin-utils" "python-docutils" "python-lxml" "python-pygments" "python-restructuredtext_lint" "python-isort" "python-whichcraft" "python-rfc3986")
makedepends=("python" "python-pip")

build() {
  pip install --no-deps --target="${_pipname}" ${_pipname}==${pkgver}
}

package() {
  mkdir -p $pkgdir/usr/lib/python3.6/site-packages/
  cp -r $srcdir/${_pipname}/* $pkgdir/usr/lib/python3.6/site-packages/
}

