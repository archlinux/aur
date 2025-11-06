# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=gnuhealth-client
pkgver=5.0.0
pkgrel=1
pkgdesc="The GNU Health GTK client"
url="https://www.gnuhealth.org/"
arch=('x86_64')
license=("GPL3")
depends=("python-gobject" "python-cairo" "python-dateutil")
makedepends=("python-build" "python-installer" "python-poetry-core")
source=("$pkgname-$pkgver.tar.gz::https://ftp.gnu.org/gnu/health/${pkgname}-${pkgver}.tar.gz")
md5sums=('053d4a01f61b985e93f145121ba892a4')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
