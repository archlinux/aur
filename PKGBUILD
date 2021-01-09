# Maintainer: Johannes Willem (Hans) Fernhout <hfern@fernhout.info>
pkgname="krapplet"
pkgver="0.1.0"
pkgrel=1
pkgdesc="Password manager based on gnome-keyring"
arch=("any")
url="https://gitlab.com/hfernh/krapplet"
license=("BSD")
depends=("python-gobject" "gtk3" "python-secretstorage")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=("24b5fc5a6e5b38524836b7f34b90ee129c814b698ba90e46cd184dad6e776f37")

build() {
    cd  "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

