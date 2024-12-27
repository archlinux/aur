# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: spider-mario <spidermario@free.fr>
pkgname=python-amply
_name=amply
pkgver=0.1.6
pkgrel=2
pkgdesc="A Python package for AMPL/GMPL datafile parsing"
arch=("any")
license=("EPL")
url="http://github.com/willu47/amply"
depends=('python-pyparsing')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('61421103ccf8e1066717115fe7917610d831d551c68d31a110876a5b6c78aea4')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
