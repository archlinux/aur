# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-pdoc
_pypiname=${pkgname/python-/}
pkgver=14.7.0
pkgrel=1
pkgdesc='A simple program and library to auto generate API documentation for Python modules.'
arch=('any')
url='https://pdoc.dev/'
license=('MIT-0')
depends=('python-jinja' 'python-pygments' 'python-markupsafe')
checkdepends=('python-pytest' 'python-pytest-timeout' 'python-hypothesis' 'nodejs')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=("2d28af9c0acc39180744ad0543e4bbc3223ecba0d1302db315ec521c51f71f93")

build() {
  cd $srcdir/${_pypiname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd $srcdir/${_pypiname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/${_pypiname}-${pkgver}-*.whl
}

