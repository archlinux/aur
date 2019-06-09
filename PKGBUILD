# Maintainer: Shane Donohoe <shane@donohoe.cc>

pkgname=python-sputils
pkgver=0.3.0
pkgrel=1
pkgdesc="A collection of spotify utilities, designed to be used with other shell utilities."
arch=('any')
url="https://github.com/shanedabes/sputils"
license=('APACHE')
depends=('python' 'python-configargparse' 'python-yaml' 'python-spotipy-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shanedabes/sputils/archive/v${pkgver}.tar.gz")
sha256sums=('60f92c05f08d1074602375ca9cab931708a4b09a4a729f2341a338f7d31c6002')

package() {
    cd "sputils-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
