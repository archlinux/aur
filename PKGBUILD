# Maintainer: Johannes Willem (Hans) Fernhout <hfern@fernhout.info>
pkgname="iwdgui"
pkgver="0.1.0"
pkgrel=1
pkgdesc="A graphical frontend for IWD, Intel's iNet Wireless Daemon"
arch=("any")
url="https://gitlab.com/hfernh/iwdgui"
license=("BSD")
depends=("python-gobject" "gtk3" "python-netifaces" "dbus-python")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=("34dce1b440274e44be0e399b3fa9043bd7916de70d2ebbb9fc903abb7c5dc8b3")
build() {
    cd  "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
