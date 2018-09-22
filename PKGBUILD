# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='printk-timestamp-formatter'
pkgdesc="Utilities to view kmsg/printk/dmesg timestamps in local time and date, UTC, or epoch seconds, TAKING INTO ACCOUNT clock drift"
pkgver=4.0.0
pkgrel=2
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/printk-timestamp-formatter"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/printk-timestamp-formatter/archive/${pkgver}.tar.gz")
sha512sums=("a788f945a511753a74f3407cf82ee651b92c1715416cb38c24dd06a99e38dfd83bcc0f39ae6bc23882d5e29645866c17449ee08cf250475ec1033d1f6b7824d4")

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "${pkgname}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

