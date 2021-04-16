# Maintainer: Roshless <pkg@roshless.com>

pkgname=python-django-prometheus
_name=${pkgname#python-}
pkgver=2.1.0
pkgrel=1
pkgdesc='Export Django monitoring metrics for Prometheus.io'
url='https://github.com/korfuri/django-prometheus'
arch=('any')
license=('apache-2.0')
depends=('python' 'python-django')
makedepends=('python-setuptools')
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
