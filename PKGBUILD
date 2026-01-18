# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=gnuhealth-client
pkgver=5.0.1
pkgrel=1
pkgdesc="The GNU Health GTK client"
url="https://www.gnuhealth.org/"
arch=('x86_64')
license=("GPL3")
depends=("python-gobject" "python-cairo" "python-dateutil")
makedepends=("python-build" "python-installer" "python-poetry-core")
source=("$pkgname-$pkgver.tar.gz::https://ftp.gnu.org/gnu/health/${pkgname}-${pkgver}.tar.gz")
md5sums=('e6ec5b3417f393dedc1a6a880e205b91')

build() {
#  cd "$pkgname-$pkgver"
  cd his-client
  python -m build --wheel --no-isolation
}

package() {
#  cd "$pkgname-$pkgver"
  cd his-client
  python -m installer --destdir="$pkgdir" dist/*.whl
}
