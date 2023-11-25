# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-pdoc
_pypiname=${pkgname/python-/}
pkgver=14.1.0
pkgrel=1
pkgdesc='A simple program and library to auto generate API documentation for Python modules.'
arch=('any')
url='https://pdoc.dev/'
license=('Unlicense')
depends=('python-jinja' 'python-pygments' 'python-markupsafe')
checkdepends=('python-pytest' 'python-pytest-timeout' 'python-hypothesis' 'nodejs')
makedepends=('python-setuptools' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=("3a0bd921a05c39a82b1505089eb6dc99d857b71b856aa60d1aca4d9086d0e18c")

build() {
  cd $srcdir/${_pypiname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd $srcdir/${_pypiname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/${_pypiname}-${pkgver}-*.whl
}

