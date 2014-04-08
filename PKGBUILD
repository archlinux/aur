# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: kevku <kevku@gmx.com>

pkgname=python-librtmp
pkgver=0.2.0
pkgrel=1
pkgdesc="Python interface to librtmp"
arch=('i686' 'x86_64')
url="https://github.com/chrippa/python-librtmp"
license=('custom: Simplified BSD')
depends=('python-singledispatch' 'python-cffi' 'rtmpdump')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('0a4385aa59f6f4d09ffa95cb85c1b0acd4678c8af3f21f45dd009d5f807a9635')

build() {
  cd $pkgname-$pkgver

  python setup.py build
}

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
