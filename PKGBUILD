# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=python-lifx-async
pkgver=5.1.0
pkgrel=1
pkgdesc="Library for controlling LIFX smart devices over the local network."
arch=(any)
url="https://github.com/Djelibeybi/lifx-async"
license=(UPL-1.0)
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/Djelibeybi/lifx-async/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2468730fb33483f90d1b26fdc33bac8f58cd83c5901857325e0fcf8b99ff9005')

build() {
  cd "lifx-async-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "lifx-async-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
