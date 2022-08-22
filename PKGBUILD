# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=inquirer
pkgname="python-$_pkgname"
pkgver=2.10.0
pkgrel=1
pkgdesc="Collection of common interactive command line user interfaces, based on Inquirer.js"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=('python' 'python-blessed' 'python-readchar' 'python-editor')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
source=("$pkgname-$pkgver.tar.gz::https://github.com/magmax/python-inquirer/archive/v$pkgver.tar.gz")
sha256sums=('d30b09e260640deabb52c0d6a7c14efd9a50494301b30f19d16a706945983edd')
b2sums=('41e0f39ec420e2bb9d12937973ac647cc192bcd9e1d6888bea5bc05633452417582af11ca76e9e093e2c4ecb17f800b6d223affead6a03be2cc00b369de60740')

build() {
  cd "python-inquirer-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "python-inquirer-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
