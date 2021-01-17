# Maintainer: Johannes Willem (Hans) Fernhout <hfern@fernhout.info>
pkgname="krapplet"
pkgver="0.2.0"
pkgrel=1
pkgdesc="Password manager based on gnome-keyring"
arch=("any")
url="https://gitlab.com/hfernh/krapplet"
license=("BSD")
depends=("python-gobject" "gtk3" "python-secretstorage")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=("853efd6be3e642aa4c97b492f2dd3956b758c82266636ebab73bc80e9ee4157b")
build() {
    cd  "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

