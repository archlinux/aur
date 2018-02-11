# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-moto
_pkgname=moto
pkgver=1.2.0
pkgrel=1
pkgdesc="Moto is a library to mock out the boto library."
arch=('any')
url="https://github.com/spulec/moto"
license=('Apache')
depends=('python' 'python-aws-xray-sdk' 'python-boto3' 'python-cookies' 'python-cryptography' 'python-dateutil' 'python-docker' 'python-mock' 'python-pyaml' 'python-requests' 'python-xmltodict' 'python-werkzeug')
checkdepends=('python-freezegun' 'python-jsondiff' 'python-nose' 'python-sure')
optdepends=('python-boto')
makedepends=('python-setuptools')
source=("https://github.com/spulec/moto/archive/$pkgver.tar.gz")
sha256sums=('86fb4b968fba16648dd17d7097ee9898ce9286e5a021c2c0126f4b5eee39fe36')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

check(){
  cd "$srcdir/$_pkgname-$pkgver"
  nosetests tests/
}
# vim:ts=2:sw=2:et:
