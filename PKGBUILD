# Maintainer: Jason McGillivray < mcgillivray dot jason at gmail dot com>


pkgname=py3status-amdfan
pkgdesc="Py3status module for monitoring fan and temp of amdgpu video cards"
pkgver=0.1.8
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'py3status' 'amdfan')
makedepends=('python-setuptools')
url="https://github.com/mcgillij/py3status-amdfan"
source=("https://github.com/mcgillij/py3status-amdfan/releases/download/$pkgver/py3status_amdfan-$pkgver.tar.gz")
md5sums=('ecca7ebb9186ee80c7306cfe42cca694')

build() {
  cd "$srcdir/py3status_amdfan-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/py3status_amdfan-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
}
