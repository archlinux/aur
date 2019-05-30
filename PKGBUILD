# Maintainer: Shane Donohoe <shane@donohoe.cc>

pkgname=python-sputils
pkgver=0.2.0
pkgrel=2
pkgdesc="A collection of spotify utilities, designed to be used with other shell utilities."
arch=('any')
url="https://github.com/shanedabes/sputils"
license=('APACHE')
depends=('python' 'python-configargparse' 'python-yaml' 'python-spotipy-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shanedabes/sputils/archive/v${pkgver}.tar.gz")
sha256sums=('673867c744c2e19bdba260ea7e8dcb06e86f308c26f0582d1c14545fef8b1914')

package() {
    cd "sputils-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
