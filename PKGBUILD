# Maintainer: w0rty <mawo97 at gmail.com>

pkgname=gomp
pkgver=1.1.0
pkgrel=1
pkgdesc="Git-based tool for comparing branches"
arch=('any')
url="https://github.com/MarkForged/GOMP"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz" "LICENSE")
sha256sums=('0bc2e81e29b89613d7cab7d28df6eca9191b7af73facdf9e8fce2ffc2220d886'
            '5eb2e11066350f22ddec76c580323277a87e132aa7487adbcb277e489fdae24d')

build() {
    cd ${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
