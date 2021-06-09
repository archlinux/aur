# Maintainer: Roshless <pkg@roshless.com>

pkgname=python-django-prometheus
_name=${pkgname#python-}
pkgver=2.1.0
pkgrel=2
pkgdesc='Export Django monitoring metrics for Prometheus.io'
url='https://github.com/korfuri/django-prometheus'
arch=('any')
license=('Apache')
depends=('python-django')
makedepends=('python-setuptools' 'python-pip')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

md5sums=('088d85f344de189989748cd790918ebc')
