# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-celery
pkgver=1.1.3
pkgrel=2
pkgdesc='A shim pytest plugin to enable celery.contrib.pytest'
arch=('any')
license=('BSD')
url='https://github.com/celery/pytest-celery'
depends=('python-celery')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'git')
source=(git+https://github.com/celery/pytest-celery#tag=v$pkgver)
sha512sums=('99eed93261d12154abe74381f8329e4c55b1a57023d3ce0e59ce6db698a2d27c40342d18592b5323e7da69549fc84552263b240c922348a830f49973c40c5aa8')

build() {
  cd pytest-celery
  python -m build --wheel --no-isolation
}

package() {
  cd pytest-celery
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
