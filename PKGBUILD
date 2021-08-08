# Maintainer: Johannes Willem (Hans) Fernhout <hfern@fernhout.info>
pkgname="iwdgui"
pkgver="0.2.0"
pkgrel=1
pkgdesc="A graphical frontend for IWD, Intel's iNet Wireless Daemon"
arch=("any")
url="https://gitlab.com/hfernh/iwdgui"
license=("BSD")
depends=("python-gobject" "gtk3" "python-netifaces" "dbus-python")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=("b4156e27c1470a5c96053ac1244fd66c03b84a9b61eb8a5a9d4a4796f1df6672")

build() {
    cd  "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
