# Maintainer: Gaël Donval <gdonval+aur at google mail>
# Contributor: Gaël Donval <gdonval+aur at google mail>

pkgbase='python-pytest-selenium'
pkgname='python-pytest-selenium'
pkgver=1.3.1
pkgrel=1
pkgdesc='Plugin for running Selenium with py.test.'
arch=('any')
url='https://github.com/pytest-dev/pytest-selenium'
license=('MPL')
makedepends=('python-setuptools')
depends=('python>=3.3'
         'python-pytest')
source=("https://github.com/pytest-dev/pytest-selenium/archive/v${pkgver}.tar.gz")
sha1sums=('500d388a0ba65465c907c4129f06778f72624e86')
md5sums=('cb1d430b91bda33f651e5752a89734e6')

build() {
  cd "${srcdir}"/pytest-selenium-$pkgver
  python setup.py build
}

package_python-pytest-selenium() {
  cd "${srcdir}"/pytest-selenium-$pkgver
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}
