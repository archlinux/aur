# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-libnacl
pkgver=1.7.2
pkgrel=3
pkgdesc='A simple ctypes based python binding to libsodium'
arch=('any')
url='https://libnacl.readthedocs.org'
license=('Apache')
depends=('python' 'libsodium')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/saltstack/libnacl/archive/v$pkgver.tar.gz")
sha512sums=('a4efbf73f73d9493ac365efa5a5bd6481f85ce4c880ad236bbf7478090bdea857e78e33e445c4e467d2a2032040863b835f32f9a942d2f1e467015bd76b0d469')

build() {
  cd libnacl-$pkgver
  python setup.py build
}

check() {
  cd libnacl-$pkgver
  python -m unittest discover --start-directory tests -v
}

package() {
  cd libnacl-$pkgver
  python setup.py install --root="$pkgdir" -O1
}
