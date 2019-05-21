# Maintainer: Shane Donohoe <shane@donohoe.cc>

pkgname=python-fzf-wal
pkgver=0.1.2
pkgrel=1
pkgdesc="pywal theme selector using fzf"
arch=('any')
url="https://github.com/shanedabes/fzf_wal"
license=('APACHE')
depends=('python' 'python-iterfzf' 'python-pywal')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shanedabes/fzf_wal/archive/v${pkgver}.tar.gz")
sha256sums=('d5ece4ee1ac009cdc11d09e8864d4794b9ff0d843998017f3bcb2fcd6dd95116')

build() {
    cd "fzf_wal-${pkgver}"
    python setup.py test
}

package() {
    cd "fzf_wal-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
