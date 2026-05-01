# Maintainer: Raphael Nestler <raphael.nestler@gmail.com>
# Contributer: Jesus Alvarez <jesusalv@rez.codes>
pkgname=python-cyclopts4
pkgver=3.16.2
pkgrel=1
pkgdesc="A modern, intuitive command line interface framework for Python"
arch=('any')
url="https://github.com/BrianPugh/cyclopts"
license=('Apache-2.0')
depends=(
    'python'
    'python-attrs'
    'python-docstring-parser'
    'python-rich'
    'python-rich-rst'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-poetry-dynamic-versioning')
source=("https://files.pythonhosted.org/packages/source/c/cyclopts/cyclopts-$pkgver.tar.gz")

provides=("python-cyclopts=$pkgver")
conflicts=('python-cyclopts')

build() {
    cd "cyclopts-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "cyclopts-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
sha256sums=('2e570336b6b1b1e10747af478f675b7cd7f66e3138a7d9bbd0aa10adf437b0d5')
