# Maintainer: Shane Donohoe <shane@donohoe.cc>

pkgname=python-sputils
pkgver=0.1.2
pkgrel=1
pkgdesc="A collection of spotify utilities, designed to be used with other shell utilities."
arch=('any')
url="https://github.com/shanedabes/sputils"
license=('APACHE')
depends=('python' 'python-configargparse' 'python-pyaml' 'python-spotipy-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shanedabes/sputils/archive/v${pkgver}.tar.gz")
sha256sums=('64bf10bbbbefacac15e1ef4d14d5dff655ad9d8f2a97a4b11a5465bbe7a3cb16')

package() {
    cd "sputils-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
