# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-celery
pkgver=0.0.0
pkgrel=5
pkgdesc='A shim pytest plugin to enable celery.contrib.pytest'
arch=('any')
license=('BSD')
url='https://github.com/celery/pytest-celery'
depends=('python-celery')
makedepends=('python-build' 'python-installer' 'python-flit-core')
source=("https://pypi.io/packages/source/p/pytest-celery/pytest-celery-$pkgver.tar.gz")
sha512sums=('5fc9c52da674ec2fcf55d6ebf278aec166877c5bd7962c786e5432e77d15132247021e4552001aad19bd7827e5b16256062eade43a8fc59c5b52e264d06b1cae')

build() {
  cd pytest-celery-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd pytest-celery-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
