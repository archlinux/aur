# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=pyocd-pemicro
pkgver=1.1.0
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
md5sums=('502afc512308fdcd58aaee7322622da1')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  python setup.py install --root="$pkgdir" --optimize=1
}

