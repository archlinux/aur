# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-pdoc
_pypiname=${pkgname/python-/}
pkgver=14.5.1
pkgrel=1
pkgdesc='A simple program and library to auto generate API documentation for Python modules.'
arch=('any')
url='https://pdoc.dev/'
license=('Unlicense')
depends=('python-jinja' 'python-pygments' 'python-markupsafe')
checkdepends=('python-pytest' 'python-pytest-timeout' 'python-hypothesis' 'nodejs')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=("4ddd9c5123a79f511cedffd7231bf91a6e0bd0968610f768342ec5d00b5eefee")

build() {
  cd $srcdir/${_pypiname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd $srcdir/${_pypiname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/${_pypiname}-${pkgver}-*.whl
}

