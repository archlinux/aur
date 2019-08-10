# Maintainer: Martin Saraceno <martin@saraceno.info>

pkgname=python-arrayfire
pkgver=3.6
pkgrel=20181017
pkgdesc="Python bindings for arrayfire"
arch=('any')
license=('BSD')
url="https://pypi.org/project/arrayfire/"
depends=('python' 'python-numpy' 'arrayfire')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/A/Arrayfire/arrayfire-$pkgver.$pkgrel.tar.gz")
sha256sums=('58e33500cea53ba01b461010e479fe1ff79d2158eb34301e05ed2b5f839afc5f')

check() {
  cd arrayfire-$pkgver.$pkgrel
  python setup.py test
}

package() {
  cd arrayfire-$pkgver.$pkgrel
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

