# Maintainer: Bernd Helm
# Based on PKGBUILD by Mike Shade <mshade@mshade.org>

_pkgname=evdev
pkgname=python-$_pkgname
pkgver=0.4.3
pkgrel=1
pkgdesc="Python bindings for the linux input handling subsystem"
arch=(any)
url="http://packages.python.org/evdev/"
license=(New BSD)
depends=(python linux-api-headers)
makedepends=(python-distribute)
provides=(python-$_pkgname=$pkgver)
conflicts=(python-$_pkgname)
source=(http://pypi.python.org/packages/source/e/$_pkgname/$_pkgname-$pkgver.tar.gz
    https://raw.github.com/gvalkov/python-$_pkgname/master/LICENSE)

package() {
    cd "$srcdir"/$_pkgname-$pkgver/
    python setup.py install --prefix=/usr --root="$pkgdir" -O1
    install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('441ccdf527718cbe54731d3b3b21e36cddba36735f01e0b9d57159883d4ab1a9'
            '0147e7d37635aabbec9d786df12f61e4cf88b40b51f595cb4e4475f64b380667')
