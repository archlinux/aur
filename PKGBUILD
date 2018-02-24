# Maintainer: Luca P <meti at lplab.net>
# Contributor: Mark E.A. <evalapply ``dot'' aur ``at'' airmail ``dot'' cc>

pkgname=python-marisa-trie
_pyname=marisa-trie
pkgver=0.7.4
pkgrel=1
pkgdesc='Static memory-efficient & fast Trie-like structures for Python (based on marisa-trie C++ library)'
arch=('i686' 'x86_64')
url='https://github.com/kmike/marisa-trie'
license=('MIT')
depends=('python' 'marisa')
makedepends=()
optdepends=()
source=("https://github.com/kmike/${_pyname}/archive/${pkgver}.tar.gz")
sha256sums=('818d6321725a28250917728c51b00ad5b86d2bde66315b12eb84dec9bff88da6')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pyname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
