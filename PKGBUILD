# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-pdoc
_pypiname=${pkgname/python-/}
pkgver=15.0.0
pkgrel=1
pkgdesc='A simple program and library to auto generate API documentation for Python modules.'
arch=('any')
url='https://pdoc.dev/'
license=('MIT-0')
depends=('python-jinja' 'python-pygments' 'python-markupsafe')
checkdepends=('python-pytest' 'python-pytest-timeout' 'python-hypothesis' 'nodejs')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=("b761220d3ba129cd87e6da1bb7b62c8e799973ab9c595de7ba1a514850d86da5")

build() {
  cd $srcdir/${_pypiname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd $srcdir/${_pypiname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/${_pypiname}-${pkgver}-*.whl
}

