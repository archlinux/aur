# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=pyocd-pemicro
pkgver=1.1.2
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
md5sums=('0f96e265c7b6d9cb1c3b0f2a6456b9f0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  python setup.py install --root="$pkgdir" --optimize=1
}

