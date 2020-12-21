# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# pkg: pypi notify-send.py
pkgname=notify-send-py
pkgver=1.2.4
pkgrel=1
pkgdesc="A python script for sending desktop notifications from the shell"

arch=(any)
url=https://github.com/phuhl/notify-send.py
license=(MIT)
makedepends=(python-setuptools)
depends=( python-notify2 python-dbus python-gobject )

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname%-*}.${pkgname##*-}/${pkgname%-*}.${pkgname##*-}-$pkgver.tar.gz")
sha256sums=('0c904213649e15411c7645e8071690da5cad88830f7fc3e35e5309dac3619a35')
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
