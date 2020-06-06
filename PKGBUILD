# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-zhon
pkgver=1.1.5
pkgrel=1
pkgdesc='Constants used in Chinese text processing'
arch=('any')
url="https://github.com/tsroten/zhon"
license=('MIT')
depends=('python-virtualenv'
         'python-sphinx'
         'python-tox'
         'python-wheel')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tsroten/zhon/archive/v${pkgver}.tar.gz")
sha256sums=('291583edc10fab6ea7dc3ad6c9054a626884d2413b9a1288f5753e4965ffbd5b')

prepare() {
  cd "zhon-${pkgver}"
  sed -i 's/ (/>=/g' requirements.txt
  sed -i 's/)//g' requirements.txt
}

package() {
  cd "zhon-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}