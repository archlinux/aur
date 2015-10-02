# Maintainer: Oliver Rümpelein <oli_r@fg4f.de>
# Based upon work of Jeff Parent <jecxjo@sdf.lonestar.org>
pkgname=python-pytest-pep8
_pypiname=pytest-pep8
pkgver=1.0.6
pkgrel=3
pkgdesc="pytest plugin to check PEP8 requirements."
arch=('any')
url="https://bitbucket.org/pytest-dev/pytest-pep8"
license=('MIT')
depends=('pep8'
		 'python'
         'python-pip'
		 'python-pytest'
		 'python-pytest-cache')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/pytest-pep8/pytest-pep8-$pkgver.tar.gz")
md5sums=('3debd0bac8f63532ae70c7351e73e993')
sha256sums=('032ef7e5fa3ac30f4458c73e05bb67b0f036a8a5cb418a534b3170f89f120318')

build() {
		cd "$srcdir/$_pypiname-$pkgver"
		python setup.py build
}

package() {
	cd "$srcdir/$_pypiname-$pkgver"
    python setup.py install --root="$pkgdir"/ --prefix="/usr" --optimize=1
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
