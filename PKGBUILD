# Maintainer: Felix Yan <felixonmars@gmail.com>
# Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Maintainer: Aaron Schaefer <aaron@elasticdog.com>

pkgbase=python-boto
pkgname=python2-boto
pkgver=2.14.0
pkgrel=1
pkgdesc='A Python interface to Amazon Web Services (AWS)'
arch=('any')
url='https://github.com/boto/boto'
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
conflicts=('python-boto>=2.5.2-1')
replaces=('python-boto>=2.5.2-1')
source=("http://github.com/boto/boto/archive/$pkgver.tar.gz"
        'LICENSE')

prepare() {
  cd "$srcdir/boto-$pkgver"

  # python2 fix
  find . -name '*.py' -type f -print0 | xargs -0 \
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_'
}

package_python2-boto() {
  cd "$srcdir/boto-$pkgver"

  python2 setup.py install --root="$pkgdir"
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha512sums=('06fa76492aa9344d3b4b17b58f044fe87c2df76b33919dcb7d8c764b72138cf4db7928d9e4d285b2c0dcde890e3aaa5e781d5a31b33ac68a6643942f6a057a30'
            '1d7ec138faa438b8302b9d15a5b8ec80dcda4b9854408095cf01f83b6d131cf6e567e564b888fdddab087953a595d85487435bb8aca445354bd0be14676a3a8d')
