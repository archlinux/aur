# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=gnuhealth-client
pkgver=4.2.1
pkgrel=1
pkgdesc="The GNU Health GTK client"
url="https://www.gnuhealth.org/"
arch=('x86_64')
license=("GPL3")
depends=("python-gobject" "python-cairo" "python-dateutil")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://ftp.gnu.org/gnu/health/${pkgname}-${pkgver}.tar.gz")
md5sums=('7d792f7c7640369ca35e3c1bf6cb4af3')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build 
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
