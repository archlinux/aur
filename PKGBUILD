# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-peakdetect
pkgver=1.2
pkgrel=1
pkgdesc='Simple peak detection'
url='https://github.com/avhn/peakdetect'
arch=('any')
license=('unknown')
depends=('python-numpy' 'python-scipy')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=(
  "git+$url#tag=v$pkgver"
  'LICENSE'
)
sha256sums=(
  'SKIP'
  '4961c1398d7e4f836b97c9db17e2f0c0bfe51a0fe5784e14c63713eb2c536a6b'
)

build() {
  cd "peakdetect"
  python -m build --wheel --no-isolation
}

package() {
  install -Dm755 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  cd "peakdetect"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
