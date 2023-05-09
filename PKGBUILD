# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-pdoc
_pypiname=${pkgname/python-/}
pkgver=13.1.1
pkgrel=1
pkgdesc='A simple program and library to auto generate API documentation for Python modules.'
arch=('any')
url='https://pdoc.dev/'
license=('Unlicense')
depends=('python-jinja' 'python-pygments' 'python-markupsafe')
checkdepends=('python-pytest' 'python-pytest-timeout' 'python-hypothesis' 'nodejs')
makedepends=('python-setuptools' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/b8/87/21dd506901c7987e36e3e59d001901ff92086f133d0533cba8e9dfb37c00/${_pypiname}-${pkgver}.tar.gz")
sha256sums=("2b8e341b1882ed8217e95c1f3f1f11d34f9ef93a5796287590162e2035296815")

build() {
  cd $srcdir/${_pypiname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd $srcdir/${_pypiname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/${_pypiname}-${pkgver}-*.whl
}

