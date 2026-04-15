# Maintainer: Winícius Cota <winicius.cota@gmail.com>
pkgname=python-universal-startfile
pkgver=0.4
pkgrel=1
pkgdesc="A cross-platform version of 'os.startfile' from the standard library."
arch=('any')
url="https://github.com/jacebrowning/universal-startfile"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/34/7a/5a79196105931ca9fef9c8c3d45de0ec33e6de6240ba17ef9b025eb4e8ec/universal_startfile-${pkgver}.tar.gz")
sha256sums=('927546329a05e497306fd71af59e93371a8ec535c44cbbd30ce42cf10f41f422')

build() {
    cd "universal_startfile-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "universal_startfile-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
