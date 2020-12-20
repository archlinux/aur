# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# pkg: pypi notify-send.py
pkgname=notify-send-py
pkgver=1.2.3
pkgrel=1
pkgdesc="A python script for sending desktop notifications from the shell"

arch=(any)
url=https://github.com/phuhl/notify-send.py
license=(MIT)
makedepends=(python-setuptools)
depends=( python-notify2 python-dbus python-gobject )

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname%-*}.${pkgname##*-}/${pkgname%-*}.${pkgname##*-}-$pkgver.tar.gz")
sha256sums=('b82b709d3baa88d455ce263ea0726d53792c855647b30ad70bdaa84ad9d0558f')
build() {
    cd "$srcdir/${pkgname%-*}.${pkgname##*-}-$pkgver"
    python setup.py build
}

package()
{
    cd "$srcdir/${pkgname%-*}.${pkgname##*-}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
