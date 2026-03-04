# Maintainer: Michał Różański <michal dot rozanski at gmail dot com>
# Contributor: Antonio Arias Orzanco <antonio dot arias99999 at gmail dot com>

_name=pyradios
pkgname=python-$_name
pkgver=2.1.1
pkgrel=1
pkgdesc="Python client for the Radio Browser API."
arch=('any')
url="https://github.com/andreztz/pyradios"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools' 'python-httpx')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andreztz/pyradios/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('ea84ad7330654cc523a5eb09771d26ad')


build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --skip-build --optimize=1
    rm -rf $pkgdir/usr/lib/python3.14/site-packages/tests
}
