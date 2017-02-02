# Maintainer: Maikel Wever <maikelwever@gmail.com>

pkgname=python-pipenv
pkgver=3.3.4
pkgrel=1
pkgdesc="An experimental project that aims to bring the best of all packaging worlds to the Python world."
url="https://github.com/kennethreitz/pipenv"
license=('MIT')
depends=('python' 'python-blindspin' 'python-click'
         'python-click-completion' 'python-crayons' 
         'python-delegator.py' 'python-parse' 'python-pexpect' 
         'python-pip' 'python-pipfile' 'python-pew' 
         'python-requests' 'python-requirements-parser' 
         'python-toml' 'python-virtualenv')

makedepends=('python-setuptools')
source=("https://github.com/kennethreitz/pipenv/archive/v${pkgver}.tar.gz")
md5sums=('cb62fba59ef1511228905f1f28cb6784')
arch=('any')

package() {
  cd "$srcdir/pipenv-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
