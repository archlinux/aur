# Maintainer: Simon Ball <contact@simonball.me>
pkgname=('python-sphinx-php-git')
pkgrel=1
pkgdesc="Sphinx Extensions for PHP and Symfony"
url="https://github.com/fabpot/sphinx-php/"
pkgver=v1.0.10.r1.g7312ecc
depends=('python')
makedepends=('git' 'python-setuptools')
license=('MIT')
arch=('any')
source=("git+https://github.com/fabpot/sphinx-php.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/sphinx-php"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package () {
    cd "${srcdir}/sphinx-php"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
