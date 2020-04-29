# Contributor: Clint Valentine <valentine.clint@gmail.com>
# Maintainer: Jean Lucas <jean@4ray.co>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-codecov
pkgver=2.0.22
pkgrel=1
pkgdesc='Report uploader for Codecov'
arch=(any)
url=https://codecov.io
license=(Apache)
depends=('python' 'python-requests')
makedepends=('python-setuptools' 'git')
source=("git+https://github.com/codecov/codecov-python#tag=v$pkgver")
sha512sums=('SKIP')

build() {
  cd "$srcdir/codecov-python"
  python setup.py build
}

package() {
  cd "$srcdir/codecov-python"
  python setup.py install --root="$pkgdir" -O1

  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
