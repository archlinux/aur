# Maintainer: Maikel Wever <maikelwever@gmail.com>

pkgname=python-pipenv
pkgver=3.2.4
pkgrel=1
pkgdesc="An experimental project that aims to bring the best of all packaging worlds to the Python world."
url="https://github.com/kennethreitz/pipenv"
license=('MIT')
depends=('python' 'python-click' 'python-crayons' 
         'python-delegator.py' 'python-parse' 'python-pexpect' 
         'python-pip' 'python-pipfile' 'python-requests' 
         'python-requirements-parser' 'python-toml' 
         'python-virtualenv')

makedepends=('python-setuptools')
source=("https://github.com/kennethreitz/pipenv/archive/v${pkgver}.tar.gz")
md5sums=('88ac2165ec1676d3686038a84f2d9a69')
arch=('any')

package() {
  cd "$srcdir/pipenv-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
