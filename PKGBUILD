# Maintainer: Christos Longros <chris.longros@gmail.com>
pkgname=python-ankipandas
pkgver=0.3.15
pkgrel=2
pkgdesc="Analyze and manipulate your Anki flashcards using pandas dataframes"
arch=('any')
url="https://github.com/klieret/AnkiPandas"
license=('MIT')
depends=(
    'python'
    'python-pandas'
    'python-numpy'
    'python-tqdm'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/a/ankipandas/ankipandas-${pkgver}.tar.gz")
sha256sums=('df59245f2b705077ae6ba4c164cc9fbaf9906bd28d29c2bf89e9700ea363dfbc')

build() {
    cd "ankipandas-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "ankipandas-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

