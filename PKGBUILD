# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Bernd Helm
# Contributor: Mike Shade <mshade@mshade.org>

_pkgname=evdev
pkgname=python-$_pkgname
pkgver=0.5.0
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
sha256sums=('509f0f6ce5a12315fcad0b7f9b41cbdfc5c5f49a7cecdd6a88ce5c1d04f6827c'
            '6aebc0c215cb6b73660175704579011215a7ca8f4e35a6c129169de217faf7fb')

package() {
    cd "$srcdir"/$_pkgname-$pkgver/
    python setup.py install --prefix=/usr --root="$pkgdir" -O1
    install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
