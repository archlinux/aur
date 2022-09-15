# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-pamqp
_pkgname=pamqp
pkgver=3.2.1
pkgrel=1
pkgdesc="RabbitMQ Focused AMQP low-level library"
arch=("any")
url="https://github.com/gmr/pamqp"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('e7cfe080bd7dfe417b603403e0082ea24c158d379cfb00cc7be544ef1e6200ae108bd93b0e4dfb06d18eb8e7d66dc268316bee79a3d910cc808fa14882b70078')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
