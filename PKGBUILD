# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-moto
_pkgname=moto
pkgver=1.3.3
pkgrel=1
pkgdesc="Moto is a library to mock out the boto library."
arch=('any')
url="https://github.com/spulec/moto"
license=('Apache')
depends=('python' 'python-aws-xray-sdk' 'python-boto' 'python-boto3' 'python-cookies' 'python-cryptography' 'python-dateutil' 'python-docker' 'python-jinja' 'python-jsondiff' 'python-jose' 'python-mock' 'python-pyaml' 'python-requests' 'python-responses' 'python-xmltodict' 'python-werkzeug')
checkdepends=('python-flask' 'python-freezegun' 'python-nose' 'python-sure' 'tk')
optdepends=('python-boto')
makedepends=('python-setuptools')
source=("https://github.com/spulec/moto/archive/$pkgver.tar.gz")
sha256sums=('c4558f2665a0e388eb3f9ec7b86616f19fe22fb8bca88a14075103418ca8ce41')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

check(){
  cd "$srcdir/$_pkgname-$pkgver"
  nosetests -sv ./tests/ --exclude='test_iot.*' --exclude='test_lambda.*'
}
# vim:ts=2:sw=2:et:
