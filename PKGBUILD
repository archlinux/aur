# Maintainer: Maikel Wever <maikelwever@gmail.com>

pkgname=pipenv
pkgver=3.5.6
pkgrel=1
pkgdesc="An experimental project that aims to bring the best of all packaging worlds to the Python world."
url="https://github.com/kennethreitz/pipenv"
license=('MIT')
conflicts=('python-pipenv')
depends=('python' 'python-blindspin' 'python-click'
         'python-click-completion' 'python-crayons' 
         'python-delegator' 'python-parse' 'python-pexpect' 
         'python-pip' 'python-pipfile' 'python-pew' 'python-psutil'
         'python-requests' 'python-requirements-parser' 
         'python-toml' 'python-virtualenv')

makedepends=('python-setuptools')
source=("https://github.com/kennethreitz/pipenv/archive/v${pkgver}.tar.gz")
md5sums=('bebc5b162800bbdfed84a21b9baa0fe8')
arch=('any')

package() {
  cd "$srcdir/pipenv-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
