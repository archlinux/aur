# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Shresth Paul (SecByShresth) <shresthpaul133@gmail.com)

pkgname=python-zconfig
pkgver=4.2
pkgrel=1
pkgdesc="Structured Configuration Library"
url="https://github.com/zopefoundation/ZConfig"
license=('ZPL')
arch=('any')
makedepends=('python-setuptools')
checkdepends=('python-zope-testrunner' 'python-manuel' 'python-docutils' 'python-nose')
source=("https://files.pythonhosted.org/packages/a7/69/cf96f0bb7e9ba45c7909401b1649922808033edc34857274cd5d3465e50d/zconfig-4.2.tar.gz")
sha256sums=('a0e4b5277c4cee8060ce335a578ac458f82c240ae96b16659200dbc4d98bfcce')

build() {
  cd zconfig-$pkgver
  python setup.py build
}

check() {
  cd zconfig-$pkgver
  nosetests3
}

package() {
  cd zconfig-$pkgver
  python3 setup.py install --root="$pkgdir" --optimize=1
}
