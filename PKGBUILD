# Maintainer: Felix Yan <felixonmars@gmail.com>
# Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Maintainer: Aaron Schaefer <aaron@elasticdog.com>

pkgbase=python-boto
pkgname=python2-boto
pkgver=2.13.3
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

sha512sums=('6b178442ef291f98b60bc53b2c62d18d178d3227a6e02fd74acfc2d6426206a3721fec00404700fc32b54d40287c1de8cb61489dd28eb66b990953fdc4e1d87b'
            '1d7ec138faa438b8302b9d15a5b8ec80dcda4b9854408095cf01f83b6d131cf6e567e564b888fdddab087953a595d85487435bb8aca445354bd0be14676a3a8d')
