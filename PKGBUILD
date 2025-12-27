# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=tsqx
_name=tsqx
pkgver=1.0.0
pkgrel=1
pkgdesc='Asymptote pre-processor for Euclidean geometry diagrams'
arch=(any)
url=https://github.com/vEnhance/tsqx
license=(MIT)
depends=(python)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
  LICENSE)

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
sha256sums=('8dd179960cb1c332f54c9027a6c37ed840963820d635d54d996691c44398ac7b'
            '98cc2ce670cd4520a18f5f76a9b69fb085efb342168e79362dc8a2a5b9c118d6')
