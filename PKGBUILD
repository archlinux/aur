# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Sean Enck <enckse@gmail.com>
# Contributor: Sanpi <sanpi+aur@homecomputing.fr>

pkgname=python-shyaml
pkgver=0.6.2
pkgrel=1
pkgdesc='YAML for the command line'
arch=('any')
url='https://github.com/0k/shyaml'
license=('BSD')
depends=('python-yaml')
makedepends=('git' 'python-d2to1' 'python-setuptools')
changelog=CHANGELOG.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/shyaml/shyaml-$pkgver.tar.gz")
sha256sums=('696e94f1c49d496efa58e09b49c099f5ebba7e24b5abe334f15e9759740b7fd0')

build() {
	cd "shyaml-$pkgver"
	python setup.py build
}

package() {
	cd "shyaml-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
