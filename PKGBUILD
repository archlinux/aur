# Maintainer: Jesus Alvarez <jesusalv@rez.codes>
pkgname=python-cyclopts
pkgver=4.12.0
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
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
source=("https://files.pythonhosted.org/packages/source/c/cyclopts/cyclopts-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "cyclopts-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "cyclopts-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
