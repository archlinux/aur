# Maintainer: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python-selenium
pkgver=2.45.0
pkgrel=1
pkgdesc="Python binding for Selenium Remote Control [Python 3]"
arch=(i686 x86_64)
url="http://pypi.python.org/pypi/selenium"
license=('Apache')
changelog='Changelog'
depends=('python')
makedepends=('python-setuptools')
optdepends=('lib32-glibc: Firefox x86 webdriver support for x86_64')
source=("http://pypi.python.org/packages/source/s/selenium/selenium-${pkgver}.tar.gz")
md5sums=('120813af730474a62a5a13058da4f602')

build() {
  cd "$srcdir/selenium-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/selenium-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# check() takes too many dependencies to run

