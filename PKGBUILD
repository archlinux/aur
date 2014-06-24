# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Bernd Helm
# Contributor: Mike Shade <mshade@mshade.org>

_pkgname=evdev
pkgname=python-$_pkgname
pkgver=0.4.4
pkgrel=1
pkgdesc="Python bindings for the linux input handling subsystem"
arch=(any)
url="http://packages.python.org/evdev/"
license=(New BSD)
depends=(python linux-api-headers)
makedepends=(python-setuptools)
provides=(python-$_pkgname=$pkgver)
conflicts=(python-$_pkgname)
source=(http://pypi.python.org/packages/source/e/$_pkgname/$_pkgname-$pkgver.tar.gz
        https://github.com/gvalkov/python-evdev/raw/d9110552d6d03bd657d876b40a066b6790e82ebb/LICENSE)

package() {
    cd "$srcdir"/$_pkgname-$pkgver/
    python setup.py install --prefix=/usr --root="$pkgdir" -O1
    install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('45fa56fb876d1d65cae2bd6736265039bc1cc875aaf55f1e4aed67138ed41c0e'
            '0147e7d37635aabbec9d786df12f61e4cf88b40b51f595cb4e4475f64b380667')
