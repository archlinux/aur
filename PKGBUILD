# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
pkgname=jcli
_pkgname=jenkins-job-cli
pkgver=0.1.0
pkgrel=1
pkgdesc='Small cli to list, run, and check jenkins jobs'
arch=('any')
url='https://github.com/brokenpip3/jcli'
license=('MIT')
depends=('python' 'python-click' 'python-rich' 'python-pyaml' 'python-api4jenkins' 'python-appdirs')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('38659d121bd13e1ebd220e473ae63ef03cdc2ba39ef208da088d561f98797e8c')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
