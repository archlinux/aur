# Maintainer: fausty <fausty@tuta.com>
pkgname=wallypub
pkgver=1.0.1
pkgrel=2
pkgdesc="A terminal tool for intentional reading and helping clear out your Wallabag backlog."
arch=('any')
url="https://codeberg.org/fausty/$pkgname"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=(
    'python-uv'
    'python-hatch'
    'python-build'
    'python-installer'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('67314a96bebee7242c92dfe00deedde388ed55e508127d8c9bc661d5dafd9755')


# build the the software
build() {
  cd $pkgname
  python -m build --wheel --no-isolation

}


# install application into package directory
package() {
   cd "$pkgname"
   python -m installer --destdir="$pkgdir" dist/*.whl
}

