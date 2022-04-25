# Maintainer: brodokk <brodokk at brodokk dot space>

_pkgname=flakeheaven
pkgname=python-$_pkgname

pkgver=0.11.0
pkgrel=1
pkgdesc="Flake8 wrapper to make it nice, legacy-friendly, configurable. Flakehell fork."

url='https://flakeheaven.readthedocs.io/'
arch=('any')
license=('MIT')

depends=('python' 'python-attrs' 'python-entrypoints' 'python-typing-extensions' 'python-termcolor' 'python-flake8-quotes' 'python-pygments' 'python-isort' 'python-pylint' 'python-urllib3' 'flake8' 'python-mccabe' 'python-flake8-commas' 'python-flit-core')
makedepends=(python-build python-installer)

source=("https://github.com/flakeheaven/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('0ed08faf8db82f76874000c383fed0743d28383c31df9dc74a80b4b997c3ae87458c147de9538ce84f3ac238230acd67ac0d3c9a5730855c7dd752c72c7f056f')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

