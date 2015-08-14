# Maintainer: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python2-selenium
pkgver=2.47.1
pkgrel=1
pkgdesc="Python binding for Selenium Remote Control [Python 2]"
arch=(i686 x86_64)
url="http://pypi.python.org/pypi/selenium"
license=('Apache')
changelog='Changelog'
depends=('python2')
makedepends=('python2-setuptools')
optdepends=('lib32-glibc: Firefox x86 webdriver support for x86_64')
source=("http://pypi.python.org/packages/source/s/selenium/selenium-${pkgver}.tar.gz")
md5sums=('7a2e267e8ef5c221bfd6387c2ad5f3bc')

build() {
  cd "$srcdir/selenium-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/selenium-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  find "$pkgdir" -name "*.py" -exec \
    sed -i '1s/python[[:space:]]*$/python2/' {} \;
}

# check() takes too many dependencies to run

