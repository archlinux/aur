# Maintainer: Raphael Nestler <raphael.nestler@gmail.com>
# Contributer: Jesus Alvarez <jesusalv@rez.codes>
pkgname=python-cyclopts4
pkgver=4.11.0
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
sha256sums=('1ffcb9990dbd56b90da19980d31596de9e99019980a215a5d76cf88fe452e94d')
