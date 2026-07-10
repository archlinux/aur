# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: spider-mario <spidermario@free.fr>
pkgname=python-amply
_name=amply
pkgver=0.1.7
pkgrel=1
pkgdesc="A Python package for AMPL/GMPL datafile parsing"
arch=("any")
license=("EPL")
url="http://github.com/willu47/amply"
depends=('python-pyparsing')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('675b73b7d76113ddb6cf743cc16ed925bccc4e72ef66991f0c7372064632b3c9')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
