# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=python-xvfbman
pkgver=1.0.0
pkgrel=2
pkgdesc='A python module for managing Xvfb sessions / ensuring DISPLAY through a simple interface'
arch=('any')
license=('LGPLv2')
url="http://github.com/kata198/xvfbman"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/xvfbman/archive/${pkgver}.tar.gz")
sha512sums=("d9a25d1dba493b68523a8c43c181fc61d49de7658e2eb9484d33ef9a193d3a269b8ced65e0586a87f5e73a2d38e31cfeb91393d9073402ba367f2f5054aeade4")

build() {
  cd "$srcdir"/xvfbman-$pkgver

  python setup.py build
}

package() {
  cd xvfbman-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
