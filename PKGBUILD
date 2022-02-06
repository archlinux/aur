# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=pyocd-pemicro
pkgver=1.1.3
pkgrel=1
pkgdesc="PEMicro probe plugin for pyOCD"
arch=('any')
url="https://github.com/pyocd/pyocd-pemicro"
license=('BSD')
depends=('python-pypemicro')
makedepends=('python-setuptools'
             'python-setuptools-scm'
             'python-setuptools-scm-git-archive')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('67c53b2c7673520990bba7277718d044')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  python setup.py install --root="$pkgdir" --optimize=1
}

