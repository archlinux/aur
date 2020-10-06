# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-raet
pkgver=0.6.8
pkgrel=5
pkgdesc='Asynchronous encrypted transaction based protocol using Ioflo'
arch=('any')
url='https://github.com/saltstack/raet'
license=('Apache')
depends=('python-libnacl' 'python-ioflo' 'python-six')
makedepends=('python-setuptools-git')
checkdepends=('python-pytest-runner' 'python-bitvector')
source=("https://pypi.io/packages/source/r/raet/raet-$pkgver.tar.gz")
sha512sums=('01279e7414ec3edc9f2bc0641cb9e0606ebf5700b5ce37a05fd5919f3274b3b43aad64110baf4c4b1fda3843cb1a87b6be4ab592a8f62e82b3a716a86ae61b20')

build() {
  cd raet-$pkgver
  python setup.py build
}

check() {
  cd raet-$pkgver
  # Disabled: very broken
  # sed -e '/import data/d' -e 's/data.createData/createData/' -i systest/lib/data.py
  # python setup.py pytest
}

package() {
  cd raet-$pkgver
  python setup.py install --root="$pkgdir" -O1
}
