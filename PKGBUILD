# Maintainer: Winícius Cota <winicius.cota@gmail.com>
pkgname=python-gitman
pkgver=3.8.1
pkgrel=1
pkgdesc="A language-agnostic dependency manager using Git."
arch=('any')
url="https://github.com/jacebrowning/gitman"
license=('MIT')
depends=('python' 'python-datafiles' 'python-minilog' 'python-universal-startfile' 'git')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/d5/6b/b914d3e047f85307d1bb87367d4363bcf265cc75e794fdb1fb9665a41f60/gitman-${pkgver}.tar.gz")
sha256sums=('7f05c37042093c0d8e77bfc0e323007a92c4629f86497a42220e87530fc3850')

build() {
    cd "gitman-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "gitman-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
