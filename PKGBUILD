# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
pkgname=jcli
_pkgname=jenkins-job-cli
_pypi_pkgname=jenkins_job_cli
pkgver=0.3.8
pkgrel=1
pkgdesc='Small cli to list, run, and check jenkins jobs'
arch=('any')
url='https://github.com/brokenpip3/jcli'
license=('MIT')
depends=('python' 'python-click' 'python-rich' 'python-pyaml' 'python-api4jenkins' 'python-appdirs')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pypi_pkgname-$pkgver.tar.gz")
sha256sums=('a111635ed51f75c6de5b66345cab2b5719770a6e448f3477c11c93a531166974')

build() {
    cd "$srcdir/$_pypi_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pypi_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
