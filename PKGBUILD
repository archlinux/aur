# Maintainer: Shane Donohoe <shane@donohoe.cc>

pkgname=python-poku
pkgver=0.1.3
pkgrel=1
pkgdesc="Symmetrical sync between pocket and buku"
arch=('any')
url="https://github.com/shanedabes/poku"
license=('APACHE')
depends=('bukuserver' 'python-configargparse' 'python-requests')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shanedabes/poku/archive/${pkgver}.tar.gz")
sha256sums=('510cfaf304e566bcff4490d2fa8b247b2fd1ed6fe43813bfd59cf3724a9d0c31')

build() {
    cd "poku-${pkgver}"
    python setup.py test
}

package() {
    cd "poku-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
