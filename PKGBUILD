# Maintainer: Nicholas Georgescu <nsg27@case.edu>

pkgname=python-mutmut
pkgver=3.4.0
pkgrel=1
pkgdesc="Mutation testing system for Python"
arch=('any')
url="https://github.com/boxed/mutmut"
license=('BSD-3-Clause')
depends=(
    'python>=3.10'
    'python-click'
    'python-coverage'
    'python-libcst'
    'python-pytest'
    'python-setproctitle'
    'python-textual'
    'python-toml'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-uv-build')
source=("https://files.pythonhosted.org/packages/source/m/mutmut/mutmut-$pkgver.tar.gz")
sha256sums=('b3b47e60828192c9f2e7737316469777f769a9163d0e384776129b80f7e8aa3e')

build() {
    cd "mutmut-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "mutmut-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
