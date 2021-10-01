# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=pyocd-pemicro
pkgver=1.0.6
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
md5sums=('e1d8aef6bc4eb945fd367d4d200cec4e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  python setup.py install --root="$pkgdir" --optimize=1
}

