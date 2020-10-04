# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# pkg: pypi notify-send.py
pkgname=notify-send-py
pkgver=1.2.1
pkgrel=1
pkgdesc="A python script for sending desktop notifications from the shell"

arch=(any)
url=https://github.com/phuhl/notify-send.py
license=(MIT)
makedepends=(python-setuptools)
depends=( python-notify2 python-dbus python-gobject )

source=(
    "https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname%-*}.${pkgname##*-}/${pkgname%-*}.${pkgname##*-}-$pkgver.tar.gz"
)
sha256sums=('ae4573ca4a4071cd38dfc97b13a18a48124cdf9f23cd6b347bbd23284de31260')
build() {
    cd "$srcdir/${pkgname%-*}.${pkgname##*-}-$pkgver"
    python setup.py build
}

package()
{
    cd "$srcdir/${pkgname%-*}.${pkgname##*-}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
