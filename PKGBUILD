# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>

pkgname=python-pyvoc
pkgver=1.3.0
pkgrel=1
arch=(any)
license=('MIT')
pkgdesc="Dictionary and vocabulary building command line tool"
url="https://github.com/makkoncept/pyvoc"
depends=('python-colorama' 'python-pyenchant' 'python-requests' 'python-termcolor')
makedepends=('python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/makkoncept/pyvoc/archive/v${pkgver}.tar.gz")
b2sums=('76b3627ff8bca1d82bc7d5b45d21debc9c7a92e85d98ad2308aef108323ebcbb2c4db75bed3eca1a3fa460cf717784a64c9bfac77f226ec57ec2fc1c5e712f61')

build() {
  cd "pyvoc-$pkgver"
  python setup.py build
}

package() {
  cd "pyvoc-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
