# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

_name=langcodes
pkgname=python-langcodes
pkgver=2.1.0
pkgrel=2
pkgdesc="A toolkit for working with and comparing the standardized codes for languages"
arch=('any')
url="https://github.com/LuminosoInsight/langcodes"
license=('Apache')
makedepends=('python'
	'python-setuptools')
depends=("python-marisa-trie")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
	"https://raw.githubusercontent.com/LuminosoInsight/langcodes/master/LICENSE.txt")
sha256sums=('75bcaca8825e1a321965b136815dee53083c63314975e024ad0ccff8545e681f'
            '326f0f4093cf7bc8d89e3711d96cb73cfa7ce7c0381a83760c6e821f96badf7f')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 "$srcdir/LICENSE.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
