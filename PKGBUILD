# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='printk-timestamp-formatter'
pkgdesc="Utilities to view kmsg/printk/dmesg timestamps in local time and date, UTC, or epoch seconds, TAKING INTO ACCOUNT clock drift"
pkgver=3.0.0
pkgrel=1
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/printk-timestamp-formatter"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/printk-timestamp-formatter/archive/${pkgver}.tar.gz")
sha512sums=("83a3fa16a472ae6b39a55f50b3182d02f481bc45df680d76419f0ed25fa1a12d70d28c71c00dbda9a679de4864cc86b4bc0a9289dcf52a6dd8fe1ec2f1956c30")

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "${pkgname}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

