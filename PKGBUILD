# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-grandalf
pkgver=0.7
pkgrel=2
pkgdesc="Python package made for experimentations with graphs drawing algorithms.."
arch=('any')
license=('custom:MIT')
url="https://github.com/bdcht/grandalf"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b3112299fe0a9123c088a16bf2f1b541d0d91199b77170a9739b569bd16a828e')
makedepends=('python-setuptools')
depends=('python-ply' 'python')
checkdepends=('python-pytest')

build() {
  cd ${pkgname#python-}-$pkgver
  python setup.py build
}

check() {
  cd ${pkgname#python-}-$pkgver
  python setup.py check
}

package() {
  cd ${pkgname#python-}-$pkgver
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
