# Maintainer: Shane Donohoe <shane@donohoe.cc>

pkgname=python-sputils
pkgver=0.1.3
pkgrel=2
pkgdesc="A collection of spotify utilities, designed to be used with other shell utilities."
arch=('any')
url="https://github.com/shanedabes/sputils"
license=('APACHE')
depends=('python' 'python-configargparse' 'python-yaml' 'python-spotipy-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shanedabes/sputils/archive/v${pkgver}.tar.gz")
sha256sums=('e6ea0d2ed65aa866c1e6a626ba8543a1d00d69986d03b2b648a9a7ae0010e3e8')

package() {
    cd "sputils-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
