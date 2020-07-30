# Maintainer: w0rty <mawo97 at gmail.com>

pkgname=gomp
pkgver=1.0.2
pkgrel=1
pkgdesc="Git-based tool for comparing branches"
arch=('any')
url="https://github.com/MarkForged/GOMP"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz" "LICENSE")
sha256sums=('6b399c252f983c5aa7133bb3bb4f51134a93f883f91a90be4f835d4091b6d0e7' '5eb2e11066350f22ddec76c580323277a87e132aa7487adbcb277e489fdae24d')

build() {
    cd ${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
