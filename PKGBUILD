# Maintainer: Shane Donohoe <shane@donohoe.cc>

pkgname=python-sputils
pkgver=0.3.1
pkgrel=1
pkgdesc="A collection of spotify utilities, designed to be used with other shell utilities."
arch=('any')
url="https://github.com/shanedabes/sputils"
license=('APACHE')
depends=('python' 'python-configargparse' 'python-yaml' 'python-spotipy-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shanedabes/sputils/archive/v${pkgver}.tar.gz")
sha256sums=('5bdf19ca49982cab269e9932f9fb353dfb81d67d8f579dbc09a96c52989de202')

package() {
    cd "sputils-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
