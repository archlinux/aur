# Maintainer: 9Sudmx <9 sudmx at proton dot me>

pkgname=beets-copyartifacts
pkgver=0.1.6
pkgrel=1
pkgdesc="A beets plugin that moves non-music files during the import process."
arch=('any')
url="https://github.com/adammillerio/$pkgname"
license=('MIT')
depends=('python' 'beets')
makedepends=('python-build' 'python-installer')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('e8d53d2aca3526b1603d50517c6b9499')

build() {
  cd "${pkgname}-${pkgver}"

  python -m build --wheel
}

package() {
  cd "${pkgname}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.rst "$pkgdir/usr/share/doc/${pkgname}/README.rst"
}
