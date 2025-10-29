# Maintainer: kraanzu <kraanzu@gmail.com>
# Maintainer: Jax Young <jaxvanyang@gmail.com>

pkgname=dooit
pkgver=3.3.3
pkgrel=1
pkgdesc="A TUI Todo Manager"
url="https://github.com/dooit-org/dooit"
arch=('any')
license=('MIT')
depends=(
    'python>=3.9'
    'python-pyperclip>=1.9.0'
    'python-yaml>=6.0.2'
    'python-tzlocal>=5.2'
    'python-textual>=3.0.0'
    'python-dateutil>=2.9.0'
    'python-sqlalchemy>=2.0.36'
    'python-platformdirs>=4.3.6'
    'python-click>=8.1.7'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-poetry-core>=1.0.0'
)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('b69aad735d779dfc9a006e2f040d8802ef4fc1a2a2dfa338eeb2ec49e2140f8b')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir "$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
