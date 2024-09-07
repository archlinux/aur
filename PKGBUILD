# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=python-espeak-ng
pkgver=0.1.8
pkgrel=1
pkgdesc="Python interface for eSpeak NG"
arch=('any')
url="https://pypi.org/project/py-espeak-ng/"
license=('Apache')
depends=('python' 'espeak-ng')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gooofy/py-espeak-ng/archive/v$pkgver.tar.gz"
        "docs.patch")
sha256sums=('705cef6a886d78f5d881775067ad89532511385d2f227b656c62051d29bfaa81'
            'eb0ba804e1d216d2d1c1f54cd826a89a117a2bc402adc35d713cc5b52bd2eb5a')

prepare() {
    cd $srcdir/py-espeak-ng-$pkgver
    patch -Np1 -i ../../docs.patch
}

package() {
    cd "$srcdir/py-espeak-ng-$pkgver"
    python setup.py install --root "$pkgdir"
}
