# Maintainer: Shane Donohoe <shane@donohoe.cc>

pkgname=python-fzf-wal
pkgver=0.1.1
pkgrel=2
pkgdesc="pywal theme selector using fzf"
arch=('any')
url="https://github.com/shanedabes/fzf_wal"
license=('APACHE')
depends=('python' 'python-iterfzf' 'python-pywal')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shanedabes/fzf_wal/archive/v${pkgver}.tar.gz")
sha256sums=('eae1f11771f30076113860eb2a5f83614744b2fe3c6694157e654dd2593437dc')

build() {
    cd "fzf_wal-${pkgver}"
    python setup.py test
}

package() {
    cd "fzf_wal-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
